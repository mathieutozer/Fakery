import Foundation
import Gen
#if os(Linux)
public struct Location {
  let latitude: Double
  let longitude: Double
}
#else
import CoreLocation
public typealias Location = CLLocationCoordinate2D
#endif

extension Faker {
  public final class Address: Generator {
    public func city(using g: inout AnyRandomNumberGenerator) -> String {
      return generate("address.city", using: &g)
    }

    public func streetName(using g: inout AnyRandomNumberGenerator) -> String {
      return generate("address.street_name", using: &g)
    }

    public func secondaryAddress(using g: inout AnyRandomNumberGenerator) -> String {
      return numerify(generate("address.secondary_address", using: &g))
    }

    public func streetAddress(includeSecondary: Bool = false, using g: inout AnyRandomNumberGenerator) -> String {
      var streetAddress = numerify(generate("address.street_address", using: &g))

      if includeSecondary {
        streetAddress += " " + secondaryAddress(using: &g)
      }

      return streetAddress
    }

    public func buildingNumber(using g: inout AnyRandomNumberGenerator) -> String {
      return bothify(generate("address.building_number", using: &g), using: &g)
    }

    public func postcode(stateAbbreviation: String = "", using g: inout AnyRandomNumberGenerator) -> String {
      if stateAbbreviation.isEmpty {
        return bothify(generate("address.postcode", using: &g), using: &g)
      }

      return bothify(generate("address.postcode_by_state.\(stateAbbreviation)", using: &g), using: &g)
    }

    public func timeZone(using g: inout AnyRandomNumberGenerator) -> String {
      return generate("address.time_zone", using: &g)
    }

    public func streetSuffix(using g: inout AnyRandomNumberGenerator) -> String {
      return generate("address.street_suffix", using: &g)
    }

    public func citySuffix(using g: inout AnyRandomNumberGenerator) -> String {
      return generate("address.city_suffix", using: &g)
    }

    public func cityPrefix(using g: inout AnyRandomNumberGenerator) -> String {
      return generate("address.city_prefix", using: &g)
    }

    public func stateAbbreviation(using g: inout AnyRandomNumberGenerator) -> String {
      return generate("address.state_abbr", using: &g)
    }

    public func state(using g: inout AnyRandomNumberGenerator) -> String {
      return generate("address.state", using: &g)
    }

    public func county(using g: inout AnyRandomNumberGenerator) -> String {
      return generate("address.county", using: &g)
    }

    public func country(using g: inout AnyRandomNumberGenerator) -> String {
      return generate("address.country", using: &g)
    }

    public func countryCode(using g: inout AnyRandomNumberGenerator) -> String {
      return generate("address.country_code", using: &g)
    }

    public func latitude(using g: inout AnyRandomNumberGenerator) -> Double {
      return  Gen.double(in: -90...90).run(using: &g)
    }

    public func longitude(using g: inout AnyRandomNumberGenerator) -> Double {
      Gen.double(in: -180...80).run(using: &g)
    }

    public func coordinate(inRadius radius: Double, fromCenter center: Location, using g: inout AnyRandomNumberGenerator) -> Location {
      let y0 = center.latitude
      let x0 = center.longitude

      // Convert meters to degrees for radius
      let radiusInDegrees = radius / 111300.0

      // Random point in circle

      let rhoRandom = Gen.double(in: 0...Double.greatestFiniteMagnitude).run(using: &g) / 0xFFFFFFFF
      let phiRandom = Gen.double(in: 0...Double.greatestFiniteMagnitude).run(using: &g) / 0xFFFFFFFF
      let rho = radiusInDegrees * sqrt(rhoRandom)
      let phi = 2 * .pi * phiRandom
      let xPos = rho * cos(phi)
      let yPos = rho * sin(phi)

      // Adjust longitude (x) to adjust for east-west shrinking in distance
      let latRadians = y0 * .pi / 180
      let newx = xPos / cos(latRadians)

      // Set found random point
      let foundLatitude = yPos + y0
      let foundLongitude = newx + x0

      return Location(latitude: foundLatitude, longitude: foundLongitude)
    }
  }
}
