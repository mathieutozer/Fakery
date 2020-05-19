import Foundation
import Gen

extension Faker {
  public final class Business: Generator {
    public func creditCardNumber(using g: inout AnyRandomNumberGenerator) -> String {
      return generate("business.credit_card_numbers", using: &g)
    }

    public func creditCardType(using g: inout AnyRandomNumberGenerator) -> String {
      return generate("business.credit_card_types", using: &g)
    }

    public func creditCardExpiryDate(using g: inout AnyRandomNumberGenerator) -> Foundation.Date? {
      let dateString = generate("business.credit_card_expiry_dates", using: &g)
      return dateFormatter.date(from: dateString)
    }
  }
}
