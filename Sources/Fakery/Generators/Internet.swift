import Foundation
import Gen

extension Faker {
  public final class Internet: Generator {
    public required init(parser: Parser) {
      super.init(parser: parser)
    }

    public func username(separator: String? = nil, using g: inout AnyRandomNumberGenerator) -> String {
      #if swift(>=4.2)
      let lastRandomComponent = Int.random(in: 0..<10000)
      #else
      let lastRandomComponent = arc4random_uniform(10000)
      #endif
      let components: [String] = [
        generate("name.first_name", using: &g),
        generate("name.last_name", using: &g),
        "\(lastRandomComponent)"
      ]

      let randomCount = components.count - 1
      #if swift(>=4.2)
      let count = Int.random(in: 0..<randomCount) + randomCount
      #else
      let count = Int(arc4random_uniform(UInt32(randomCount)) + UInt32(randomCount))
      #endif

      var gap = ""
      if let sep = separator {
        gap = sep
      }

      return components[0..<count].joined(separator: gap)
                                  .replacingOccurrences(of: "'", with: "")
                                  .lowercased()
    }

    public func domainName(_ alphaNumericOnly: Bool = true, using g: inout AnyRandomNumberGenerator) -> String {
      return domainWord(alphaNumericOnly: alphaNumericOnly, using: &g) + "." + domainSuffix(using: &g)
    }

    public func domainWord(alphaNumericOnly: Bool = true, using g: inout AnyRandomNumberGenerator) -> String {
      let nameParts = generate("company.name", using: &g).components(separatedBy: " ")
      var name = ""

      if let first = nameParts.first {
        name = first
      } else {
        name = letterify("?????", using: &g)
      }

      let result = alphaNumericOnly ? alphaNumerify(name) : name

      return result.lowercased()
    }

    public func domainSuffix(using g: inout AnyRandomNumberGenerator) -> String {
      return generate("internet.domain_suffix", using: &g)
    }

    public func email(using g: inout AnyRandomNumberGenerator) -> String {
      return [username(using: &g), domainName(using: &g)].joined(separator: "@")
    }

    public func freeEmail(using g: inout AnyRandomNumberGenerator) -> String {
      return [username(using: &g), generate("internet.free_email", using: &g)].joined(separator: "@")
    }

    public func safeEmail(using g: inout AnyRandomNumberGenerator) -> String {
      let topLevelDomains = ["org", "com", "net"]
      #if swift(>=4.2)
      let topLevelDomain = topLevelDomains.randomElement() ?? ""
      #else
      let count = UInt32(topLevelDomains.count)
      let topLevelDomain = topLevelDomains[Int(arc4random_uniform(count))]
      #endif

      return [username(using: &g), "example." + topLevelDomain].joined(separator: "@")
    }

    public func password(minimumLength: Int = 8, maximumLength: Int = 16) -> String {
      var temp = String.characters(amount: minimumLength)
      let diffLength = maximumLength - minimumLength

      if diffLength > 0 {
        #if swift(>=4.2)
        let diffRandom = Int.random(in: 0..<diffLength + 1)
        #else
        let diffRandom = Int(arc4random_uniform(UInt32(diffLength + 1)))
        #endif
        temp += String.characters(amount: diffRandom)
      }

      return temp
    }

    public func ipV4Address() -> String {
      #if swift(>=4.2)
      let randomNumber = UInt32.random(in: 0..<UInt32.max) % 253
      #else
      let randomNumber = arc4random() % 253
      #endif
      let ipRand = {
        2 + randomNumber
      }

      return String(format: "%d.%d.%d.%d", ipRand(), ipRand(), ipRand(), ipRand())
    }

    public func ipV6Address() -> String {
      #if swift(>=4.2)
      let randomNumber = UInt32.random(in: 0..<UInt32.max) % 65536
      #else
      let randomNumber = arc4random() % 65536
      #endif

      var components: [String] = []

      for _ in 0..<8 {
        components.append(String(format: "%X", randomNumber))
      }

      return components.joined(separator: ":")
    }

    public func url(using g: inout AnyRandomNumberGenerator) -> String {
      return "https://\(domainName(using: &g))/\(username(using: &g))"
    }

    public func image(width: Int = 320, height: Int = 200) -> String {
      return "https://lorempixel.com/\(width)/\(height)"
    }

    public func templateImage(width: Int = 320, height: Int = 200,
                              backColorHex: String = "000000", frontColorHex: String = "ffffff") -> String {
      return "https://dummyimage.com/\(width)x\(height)/\(backColorHex)/\(frontColorHex)"
    }

    public func hashtag(using g: inout AnyRandomNumberGenerator) -> String {
      return generate("internet.hashtag", using: &g)
    }

    // @ToDo - slug
  }
}
