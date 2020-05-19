import Foundation
import Gen

extension Faker {
  public final class Commerce: Generator {
    public func color(using g: inout AnyRandomNumberGenerator) -> String {
      return generate("commerce.color", using: &g)
    }

    public func department(maximum: Int = 3, fixedAmount: Bool = false, using g: inout AnyRandomNumberGenerator) -> String {
      #if swift(>=4.2)
      let amount = fixedAmount ? maximum : 1 + Int.random(in: 0..<maximum)
      #else
      let amount = fixedAmount ? maximum : 1 + Int(arc4random_uniform(UInt32(maximum)))
      #endif
      let fetchedCategories = categories(amount, using: &g)
      let count = fetchedCategories.count

      var department = ""

      if count > 1 {
        department = merge(categories: fetchedCategories, using: &g)
      } else if count == 1 {
        department = fetchedCategories[0]
      }

      return department
    }

    public func productName(using g: inout AnyRandomNumberGenerator) -> String {
      return generate("commerce.product_name.adjective", using: &g) + " "
        + generate("commerce.product_name.material", using: &g) + " "
        + generate("commerce.product_name.product", using: &g)
    }

    public func price() -> Double {
      let arc4randoMax: Double = 0x100000000
      #if swift(>=4.2)
      return floor(Double((Double(UInt32.random(in: 0..<UInt32.max)) / arc4randoMax) * 100.0) * 100) / 100.0
      #else
      return floor(Double((Double(arc4random()) / arc4randoMax) * 100.0) * 100) / 100.0
      #endif
    }

    // MARK: - Helpers

    public func categories(_ amount: Int, using g: inout AnyRandomNumberGenerator) -> [String] {
      var categories: [String] = []

      while categories.count < amount {
        let category = generate("commerce.department", using: &g)

        if !categories.contains(category) {
          categories.append(category)
        }
      }

      return categories
    }

    public func merge(categories: [String], using g: inout AnyRandomNumberGenerator) -> String {
      let separator = generate("separator", using: &g)
      let commaSeparated = categories[0..<categories.count - 1].joined(separator: ", ")

      return commaSeparated + separator + categories.last!
    }
  }
}
