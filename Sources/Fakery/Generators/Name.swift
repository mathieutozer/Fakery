import Gen

extension Faker {
  public final class Name: Generator {
    public func name(using g: inout AnyRandomNumberGenerator) -> String {
      return generate("name.name", using: &g)
    }

    public func firstName(using g: inout AnyRandomNumberGenerator) -> String {
      return generate("name.first_name", using: &g)
    }

    public func lastName(using g: inout AnyRandomNumberGenerator) -> String {
      return generate("name.last_name", using: &g)
    }

    public func prefix(using g: inout AnyRandomNumberGenerator) -> String {
      return generate("name.prefix", using: &g)
    }

    public func suffix(using g: inout AnyRandomNumberGenerator) -> String {
      return generate("name.suffix", using: &g)
    }

    public func title(using g: inout AnyRandomNumberGenerator) -> String {
      return generate("name.title.descriptor", using: &g) + " "
        + generate("name.title.level", using: &g) + " "
        + generate("name.title.job", using: &g)
    }
  }
}
