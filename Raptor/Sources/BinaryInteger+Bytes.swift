import Foundation

extension BinaryInteger {
    
    var bytes: [UInt8] {
        var bytes = [UInt8]()
        var value = self
        while value > 0 {
            bytes.append(UInt8(value) & 0xFF)
            value >>= 8
        }
        return bytes + Array(repeating: 0, count: MemoryLayout<Self>.stride - bytes.count)
    }
    
    var isOdd: Bool {
        return self & 1 == 1
    }
    
    var isEven: Bool {
        return !isOdd
    }
    
}
