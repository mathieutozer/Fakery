import Foundation
import Gen

extension Array {
  func at(_ index: Int?) -> Element? {
    guard let index = index, index >= 0 && index < endIndex else {
      return nil
    }

    return self[index]
  }

  func random(using g: inout AnyRandomNumberGenerator) -> Element? {
    // swiftlint:disable empty_count
    guard count > 0 else {
      return nil
    }
    return Gen.element(of: self).run(using: &g)
  }
}
