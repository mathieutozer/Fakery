import Quick
import Nimble
@testable import Fakery

final class TeamSpec: QuickSpec {
  override func spec() {
    describe("Team") {
      var team: Faker.Team!

      beforeEach {
        let parser = Parser(locale: "en-TEST")
        team = Faker.Team(parser: parser)
      }

      describe("#name") {
        it("returns the correct text") {
          let name = team.name(using: &system)
          expect(name).to(equal("California owls"))
        }
      }

      describe("#creature") {
        it("returns the correct text") {
          let creature = team.creature(using: &system)
          expect(creature).to(equal("owls"))
        }
      }

      describe("#state") {
        it("returns the correct text") {
          let state = team.state(using: &system)
          expect(state).to(equal("California"))
        }
      }
    }
  }
}
