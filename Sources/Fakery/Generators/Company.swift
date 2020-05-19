import Foundation
import Gen

extension Faker {
  public final class Company: Generator {
    public func name(using g: inout AnyRandomNumberGenerator) -> String {
      return generate("company.name", using: &g)
    }

    public func suffix(using g: inout AnyRandomNumberGenerator) -> String {
      return generate("company.suffix", using: &g)
    }

    public func catchPhrase(using g: inout AnyRandomNumberGenerator) -> String {
      return randomWordsFromKey("company.buzzwords", using: &g)
    }

    public func bs(using g: inout AnyRandomNumberGenerator) -> String {
      return randomWordsFromKey("company.bs", using: &g)
    }

    public func logo(using g: inout AnyRandomNumberGenerator) -> String {
      #if swift(>=4.2)
      let number = Int.random(in: 0..<13) + 1
      #else
      let number = Int(arc4random_uniform(13)) + 1
      #endif
      return "https://pigment.github.io/fake-logos/logos/medium/color/\(number).png"
    }
  }
}
