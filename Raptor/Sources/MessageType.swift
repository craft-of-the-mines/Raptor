import Foundation

enum MessageType: UInt32 {
    case serverResponse = 0
    case serverCommand = 2
    case serverAuthorize = 3
    case authorizePacket = 5
    case commandPacket = 6
}
