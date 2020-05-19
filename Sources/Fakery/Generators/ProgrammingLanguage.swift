import Gen

extension Faker {
  public final class ProgrammingLanguage: Generator {
    public func name(using g: inout AnyRandomNumberGenerator) -> String {
      return generate("programming_language.name", using: &g)
    }

    public func creator(using g: inout AnyRandomNumberGenerator) -> String {
      return generate("programming_language.creator", using: &g)
    }
  }
}
