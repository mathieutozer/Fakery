import Gen

extension Faker {
  public final class Ham: Generator {
    public func name(using g: inout AnyRandomNumberGenerator) -> String {
      return generate("ham.name", using: &g)
    }
  }
}
