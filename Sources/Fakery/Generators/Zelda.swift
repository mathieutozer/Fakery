import Gen

extension Faker {
  public final class Zelda: Generator {
    public func game(using g: inout AnyRandomNumberGenerator) -> String {
      return generate("zelda.game", using: &g)
    }
  }
}


