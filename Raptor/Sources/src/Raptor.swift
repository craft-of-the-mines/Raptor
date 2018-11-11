//
//  Raptor.swift
//  Raptor
//
//  Created by ライアン on 11/11/18.
//  Copyright © 2018 Craft of the Mines. All rights reserved.
//

import Foundation

public enum MessageType: Int {
    case serverData = 2
}

public class Raptor {
    
    let srcon: UnsafeMutableRawPointer
    private let ipPointer: UnsafePointer<Int8>
    private let port: Int
    private let passwordPointer: UnsafePointer<Int8>
    
    var ip: String {
        return String(cString: ipPointer)
    }
    
    var password: String {
        return String(cString: passwordPointer)
    }
    
    init(ip: String, port: Int, password: String) {
        self.ipPointer = UnsafePointer((ip as NSString).utf8String!)
        self.port = port
        self.passwordPointer = UnsafePointer((password as NSString).utf8String!)
        srcon = srcon_create(ipPointer, Int32(port), passwordPointer)
    }
    
    deinit {
        ipPointer.deallocate()
        passwordPointer.deallocate()
    }
    
    func send(message: String, type: MessageType = .serverData) -> String {
        return String(cString: message.withCString {
            srcon_send(srcon, $0, Int32(type.rawValue))
        })
    }
    
}
