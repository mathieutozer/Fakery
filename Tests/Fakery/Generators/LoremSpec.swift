import Quick
import Nimble
@testable import Fakery

final class LoremSpec: QuickSpec {
  override func spec() {
    describe("Lorem") {
      var lorem: Faker.Lorem!

      beforeEach {
        let parser = Parser(locale: "en-TEST")
        lorem = Faker.Lorem(parser: parser)
      }

      describe("#word") {
        it("returns the correct text") {
          let word = lorem.word(using: &system)
          expect(word).to(match("^[A-Za-z]+$"))
        }
      }

      describe("#words") {
        context("without the amount - 3 words by default") {
          it("returns the expected amount of words") {
            let word = lorem.words(using: &system)
            expect(word).to(match("^[A-Za-z]+ [A-Za-z]+ [A-Za-z]+$"))
          }
        }

        context("with the amount of words") {
          it("returns the expected amount of words") {
            let word = lorem.words(amount: 2, using: &system)
            expect(word).to(match("^[A-Za-z]+ [A-Za-z]+$"))
          }
        }
      }

      describe("#character") {
        it("returns the correct character") {
          let char = lorem.character(using: &system)
          expect(char).to(match("^[A-Za-z]$"))
        }
      }

      describe("#characters") {
        context("without the amount - 255 chars by default") {
          it("returns the expected amount of characters") {
            let chars = lorem.characters(using: &system)
            expect(chars).to(match("^[A-Za-z]{255}"))
          }
        }

        context("with the amount of chars") {
          it("returns the expected amount of characters") {
            let chars = lorem.characters(amount: 7, using: &system)
            expect(chars).to(match("^[A-Za-z]{7}"))
          }
        }
      }

      describe("#sentence") {
        context("without the amount - 4 words by default") {
          it("returns the expected amount of words") {
            let sentence = lorem.sentence(using: &system)
            expect(sentence).to(match("^[A-Z][A-Za-z]+ [A-Za-z]+ [A-Za-z]+ [A-Za-z]+.$"))
          }
        }

        context("with the amount of words") {
          it("returns the expected amount of words") {
            let sentence = lorem.sentence(wordsAmount: 2, using: &system)
            expect(sentence).to(match("^[A-Z][A-Za-z]+ [A-Za-z]+.$"))
          }
        }
      }

      describe("#sentences") {
        context("without the amount - 3 sentences by default") {
          it("returns the expected amount of sentences") {
            let sentences = lorem.sentences(using: &system)
            expect(sentences).to(match("^[A-Za-z ]+. [A-Za-z ]+. [A-Za-z ]+.$"))
          }
        }

        context("with the amount of sentences") {
          it("returns the expected amount of sentences") {
            let sentences = lorem.sentences(amount: 2, using: &system)
            expect(sentences).to(match("^[A-Za-z ]+. [A-Za-z ]+.$"))
          }
        }
      }

      describe("#paragraph") {
        context("without the amount - 3 sentence by default") {
          it("returns the expected amount of sentences") {
            let paragraph = lorem.paragraph(using: &system)
            expect(paragraph).to(match("^[A-Za-z ]+. [A-Za-z ]+. [A-Za-z ]+.$"))
          }
        }

        context("with the amount of words") {
          it("returns the expected amount of sentences") {
            let sentence = lorem.paragraph(sentencesAmount: 2, using: &system)
            expect(sentence).to(match("^[A-Za-z ]+. [A-Za-z ]+.$"))
          }
        }
      }

      describe("#paragraphs") {
        context("without the amount - 3 paragraphs by default") {
          it("returns the expected amount of paragraphs") {
            let paragraphs = lorem.paragraphs(using: &system)
            expect(paragraphs).to(match("^[A-Za-z .]+\\n[A-Za-z .]+\\n[A-Za-z .]+$"))
          }
        }

        context("with the amount of paragraphs") {
          it("returns the expected amount of paragraphs") {
            let paragraphs = lorem.paragraphs(amount: 2, using: &system)
            expect(paragraphs).to(match("^[A-Za-z .]+\\n[A-Za-z .]+$"))
          }
        }
      }

    }
  }
}
