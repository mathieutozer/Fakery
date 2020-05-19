import Foundation
import Gen

extension Faker {
  public final class Hobbit: Generator {
    public func character(using g: inout AnyRandomNumberGenerator) -> String {
      return generate("hobbit.character", using: &g)
    }

    public func thorinsCompany(using g: inout AnyRandomNumberGenerator) -> String {
      return generate("hobbit.thorins_company", using: &g)
    }

    public func quote(using g: inout AnyRandomNumberGenerator) -> String {
      return generate("hobbit.quote", using: &g)
    }

    public func location(using g: inout AnyRandomNumberGenerator) -> String {
      return generate("hobbit.location", using: &g)
    }
  }
}
