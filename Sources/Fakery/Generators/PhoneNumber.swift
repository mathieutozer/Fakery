import Gen

extension Faker {
  public final class PhoneNumber: Generator {
    public func phoneNumber(using g: inout AnyRandomNumberGenerator) -> String {
      return numerify(generate("phone_number.formats", using: &g))
    }

    public func cellPhone(using g: inout AnyRandomNumberGenerator) -> String {
      return numerify(generate("cell_phone.formats", using: &g))
    }

    // US only
    public func areaCode(using g: inout AnyRandomNumberGenerator) -> String {
      return generate("phone_number.area_code", using: &g)
    }

    // US only
    public func exchangeCode(using g: inout AnyRandomNumberGenerator) -> String {
      return generate("phone_number.exchange_code", using: &g)
    }

    // US only
    public func subscriberNumber() -> String {
      return numerify("####")
    }

    public func numberExtension(_ length: Int) -> String {
      var template = ""

      for _ in 1...length {
        template += "#"
      }

      return numerify(template)
    }
  }
}
