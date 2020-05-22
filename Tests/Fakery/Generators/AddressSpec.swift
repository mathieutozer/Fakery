import Quick
import Nimble
import Gen

@testable import Fakery

var system = AnyRandomNumberGenerator(SystemRandomNumberGenerator())

final class AddressSpec: QuickSpec {
  override func spec() {
    describe("Address") {
      var address: Faker.Address!

      beforeEach {
        let parser = Parser(locale: "en-TEST")
        address = Faker.Address(parser: parser)
      }

      describe("#city") {
        it("returns the correct text") {
          let city = address.city(using: &system)
          expect(city).to(equal("North Vadymtown"))
        }
      }

      describe("#streetName") {
        it("returns the correct text") {
          let streetName = address.streetName(using: &system)
          expect(streetName).to(equal("Vadym Avenue"))
        }
      }

      describe("#secondaryAddress") {
        it("returns the correct text") {
          let secondaryAddress = address.secondaryAddress(using: &system)
          expect(secondaryAddress).to(match("^Apt. \\d{3}$"))
        }
      }

      describe("#streetAddress") {
        context("without secondary") {
          it("returns the correct text") {
            let streetAddress = address.streetAddress(using: &system)
            expect(streetAddress).to(match("^\\d{5} Vadym Avenue$"))
          }
        }

        context("include secondary") {
          it("returns the correct text") {
            let streetAddress = address.streetAddress(includeSecondary: true, using: &system)
            expect(streetAddress).to(match("^\\d{5} Vadym Avenue Apt. \\d{3}$"))
          }
        }
      }

      describe("#buildingNumber") {
        it("returns the correct text") {
          let buildingNumber = address.buildingNumber(using: &system)
          expect(buildingNumber).to(match("^\\d{5}$"))
        }
      }

      describe("#postcode") {
        context("without the state abbreviation") {
          it("returns the correct text") {
            let postcode = address.postcode(using: &system)
            expect(postcode).to(match("^\\d{5}-\\d{4}$"))
          }
        }

        context("with the state abbreviation") {
          it("returns the correct text") {
            let postcode = address.postcode(stateAbbreviation: "CA", using: &system)
            expect(postcode).to(match("^900\\d{2}$"))
          }
        }

        context("with the wrong state abbreviation") {
          it("returns the correct text") {
            let postcode = address.postcode(stateAbbreviation: "TE", using: &system)
            expect(postcode).to(beEmpty())
          }
        }
      }

      describe("#timeZone") {
        it("returns the correct text") {
          let timeZone = address.timeZone(using: &system)
          expect(timeZone).to(equal("America/Los_Angeles"))
        }
      }

      describe("#streetSuffix") {
        it("returns the correct text") {
          let streetSuffix = address.streetSuffix(using: &system)
          expect(streetSuffix).to(equal("Avenue"))
        }
      }

      describe("#citySuffix") {
        it("returns the correct text") {
          let citySuffix = address.citySuffix(using: &system)
          expect(citySuffix).to(equal("town"))
        }
      }

      describe("#cityPrefix") {
        it("returns the correct text") {
          let cityPrefix = address.cityPrefix(using: &system)
          expect(cityPrefix).to(equal("North"))
        }
      }

      describe("#stateAbbreviation") {
        it("returns the correct text") {
          let stateAbbreviation = address.stateAbbreviation(using: &system)
          expect(stateAbbreviation).to(equal("CA"))
        }
      }

      describe("#state") {
        it("returns the correct text") {
          let state = address.state(using: &system)
          expect(state).to(equal("California"))
        }
      }

      describe("#county") {
        it("returns the correct text") {
          let country = address.county(using: &system)
          expect(country).to(equal("Autauga County"))
        }
      }

      describe("#country") {
        it("returns the correct text") {
          let country = address.country(using: &system)
          expect(country).to(equal("United States of America"))
        }
      }

      describe("#countryCode") {
        it("returns the correct text") {
          let countryCode = address.countryCode(using: &system)
          expect(countryCode).to(equal("US"))
        }
      }

      describe("#latitude") {
        it("returns non-zero value") {
          let latitude = address.latitude(using: &system)
          expect(latitude).notTo(equal(0))
        }
      }

      describe("#longitude") {
        it("returns non-zero value") {
          let longitude = address.longitude(using: &system)
          expect(longitude).notTo(equal(0))
        }
      }
    }
  }
}
