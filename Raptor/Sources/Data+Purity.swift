import Foundation

extension Data {

    func appending(_ bytes: [UInt8]) -> Data {
        var copy = self
        copy.append(contentsOf: bytes)
        return copy
    }

}
