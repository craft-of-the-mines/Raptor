import Foundation
import Socket

public class Raptor {
    
    enum ClientError: Error {
        case unserializableCommand
    }
    
    public let host: String
    public let port: Int32
    public let password: String
        
    private var currentPacketID: UInt32 = 0
    
    private let socket: Socket
    
    public init(host: String, port: Int32, password: String) throws {
        self.host = host
        self.port = port
        self.password = password
        do {
            try socket = Socket.create()
            try socket.connect(to: host, port: port)
            try write(.serverAuthorize, message: password)
        }
    }
    
    deinit {
        socket.close()
    }
    
    public func sendCommand(_ command: String) throws {
        try write(.serverCommand, message: command)
    }
    
    @discardableResult private func write(_ type: MessageType, message: String) throws -> Data {
        guard let messageData = message.data(using: .ascii, allowLossyConversion: true).map(Array.init) else {
            throw ClientError.unserializableCommand
        }
        
        try socket.write(from: Data(bytes:
            UInt32(message.count + 10).bytes +
                currentPacketID.bytes +
                type.rawValue.bytes +
                messageData +
                [0, 0]
        ))
        currentPacketID += 1
        return try socket.read()
    }
    
}
