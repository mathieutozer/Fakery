import Quick
import Nimble
@testable import Fakery

final class AppSpec: QuickSpec {
  override func spec() {
    describe("App") {
      var app: Faker.App!

      beforeEach {
        let parser = Parser(locale: "en-TEST")
        app = Faker.App(parser: parser)
      }

      describe("#name") {
        it("returns the correct text") {
          let name = app.name(using: &system)
          expect(name).to(equal("Namfix"))
        }
      }

      describe("#version") {
        it("returns the correct text") {
          let version = app.version(using: &system)
          expect(version).to(match("^0.\\d.\\d$"))
        }
      }

      describe("#author") {
        it("returns the correct text") {
          let author = app.author(using: &system)
          expect(author).to(equal("Mr. Vadym Markov"))
        }
      }
    }
  }
}
