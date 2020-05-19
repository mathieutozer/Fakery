import Foundation
import Gen

extension Faker {
  public final class Gender: Generator {
    public func type(using g: inout AnyRandomNumberGenerator) -> String {
      return generate("gender.type", using: &g)
    }

    public func binaryType(using g: inout AnyRandomNumberGenerator) -> String {
      return generate("gender.binary_type", using: &g)
    }
  }
}
