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
    
    init(ip: String, port: Int, password: String) {
        srcon = srcon_create(UnsafePointer((ip as NSString).utf8String!), Int32(port), UnsafePointer((password as NSString).utf8String!))
    }
    
    func send(message: String, type: MessageType = .serverData) {
        srcon_send(srcon, UnsafePointer((message as NSString).utf8String!), Int32(type.rawValue))
    }
    
}
