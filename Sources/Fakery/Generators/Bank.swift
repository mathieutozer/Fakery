import Gen

extension Faker {
  public final class Bank: Generator {
    public func name(using g: inout AnyRandomNumberGenerator) -> String {
      return generate("bank.name", using: &g)
    }

    public func swiftBic(using g: inout AnyRandomNumberGenerator) -> String {
      return generate("bank.swiftBic", using: &g)
    }

    public func iban(using g: inout AnyRandomNumberGenerator) -> String {
      let bankCountryCode = generate("bank.ibanDetails.bankCountryCode", using: &g)
      let bankCountryString = numerify("##")
      let ibanLetterCode = letterify(generate("bank.ibanDetails.ibanLetterCode", using: &g), using: &g)
      let iban = numerify(generate("bank.ibanDetails.ibanDigits", using: &g))

      return bankCountryCode + bankCountryString + ibanLetterCode + iban
    }

    public func bban(using g: inout AnyRandomNumberGenerator) -> String {
      let ibanLetterCode: String = letterify(generate("bank.ibanDetails.ibanLetterCode", using: &g), using: &g)
      let iban: String = numerify(generate("bank.ibanDetails.ibanDigits", using: &g))

      return ibanLetterCode + iban
    }
  }
}
