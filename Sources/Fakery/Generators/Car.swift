import Foundation
import Gen

extension Faker {
  public final class Car: Generator {
    public func brand(using g: inout AnyRandomNumberGenerator) -> String {
      return generate("car.brand", using: &g)
    }
  }
}
