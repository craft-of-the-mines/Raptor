import Foundation
import Socket

extension Socket {
    
    func read() throws -> Data {
        var data = Data()
        _ = try read(into: &data)
        return data
    }
    
}
