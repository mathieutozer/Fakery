import Foundation
import Gen

extension Faker {
  public final class Lorem: Generator {
    public func word(using g: inout AnyRandomNumberGenerator) -> String {
      return generate("lorem.words", using: &g)
    }

    public func words(amount: Int = 3, using g: inout AnyRandomNumberGenerator) -> String {
      var words: [String] = []

      for _ in 0..<amount {
        words.append(word(using: &g))
      }

      return words.joined(separator: " ")
    }

    public func character(using g: inout AnyRandomNumberGenerator) -> String {
      return characters(amount: 1, using: &g)
    }

    public func characters(amount: Int = 255, using g: inout AnyRandomNumberGenerator) -> String {
      return String.characters(amount: amount, using: &g)
    }

    public func sentence(wordsAmount: Int = 4, using g: inout AnyRandomNumberGenerator) -> String {
      var sentence = words(amount: wordsAmount, using: &g) + "."
      sentence.replaceSubrange(sentence.startIndex...sentence.startIndex,
                               with: String(sentence[sentence.startIndex]).capitalized)
      return sentence
    }

    public func sentences(amount: Int = 3, using g: inout AnyRandomNumberGenerator) -> String {
      var sentences: [String] = []

      for _ in 0..<amount {
        sentences.append(sentence(using: &g))
      }

      return sentences.joined(separator: " ")
    }

    public func paragraph(sentencesAmount: Int = 3, using g: inout AnyRandomNumberGenerator) -> String {
      return sentences(amount: sentencesAmount, using: &g)
    }

    public func paragraphs(amount: Int = 3, using g: inout AnyRandomNumberGenerator) -> String {
      var paragraphs: [String] = []

      for _ in 0..<amount {
        paragraphs.append(paragraph(using: &g))
      }

      return paragraphs.joined(separator: "\n")
    }
  }
}
