import Gen

extension Faker {
  public final class App: Generator {
    public func name(using g: inout AnyRandomNumberGenerator) -> String {
      return generate("app.name", using: &g)
    }

    public func version(using g: inout AnyRandomNumberGenerator) -> String {
      return numerify(generate("app.version", using: &g))
    }

    public func author(using g: inout AnyRandomNumberGenerator) -> String {
      return generate("app.author", using: &g)
    }
  }
}
