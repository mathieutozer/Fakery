import Gen

extension Faker {
  public final class Team: Generator {
    public func name(using g: inout AnyRandomNumberGenerator) -> String {
      return generate("team.name", using: &g)
    }

    public func creature(using g: inout AnyRandomNumberGenerator) -> String {
      return generate("team.creature", using: &g)
    }

    public func state(using g: inout AnyRandomNumberGenerator) -> String {
      return generate("address.state", using: &g).capitalized
    }
  }
}
