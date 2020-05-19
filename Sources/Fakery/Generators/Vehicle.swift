import Gen

extension Faker {
  public final class Vehicle: Generator {
    public func manufacture(using g: inout AnyRandomNumberGenerator) -> String {
      return generate("vehicle.manufacture", using: &g)
    }

    public func make(using g: inout AnyRandomNumberGenerator) -> String {
      return generate("vehicle.makes", using: &g)
    }

    public func colors(using g: inout AnyRandomNumberGenerator) -> String {
      return generate("vehicle.colors", using: &g)
    }
  }
}
