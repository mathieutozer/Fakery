import Foundation
import Gen

extension Faker {
  public final class Cat: Generator {
    public func name(using g: inout AnyRandomNumberGenerator) -> String {
      return generate("cat.name", using: &g)
    }

    public func breed(using g: inout AnyRandomNumberGenerator) -> String {
      return generate("cat.breed", using: &g)
    }

    public func registry(using g: inout AnyRandomNumberGenerator) -> String {
      return generate("cat.registry", using: &g)
    }
  }
}
