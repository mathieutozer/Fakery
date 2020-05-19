import Gen

extension Faker {
  public final class House: Generator {
    public func furniture(using g: inout AnyRandomNumberGenerator) -> String {
      return generate("house.furniture", using: &g)
    }

    public func room(using g: inout AnyRandomNumberGenerator) -> String {
      return generate("house.room", using: &g)
    }
  }
}
