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
    #if swift(>=4.2)
    return Gen.element(of: self).run(using: &g)
    #else
     return self[Int(arc4random_uniform(UInt32(count)))]
    #endif
  }
}
