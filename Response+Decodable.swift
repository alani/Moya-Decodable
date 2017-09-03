//
//  Response+Decodable.swift
//  Moya-Decodable
//
//  Created by Ahmed Alani.
//  Copyright © 2017 Ahmed Alani. All rights reserved.
//

import Foundation
import Moya
import Decodable

public extension Moya.Response {
    public func map<T: Decodable>(_ type: T.Type)
        throws -> T {
            return try type.decode(try self.mapJSON())
    }
    
    public func map<T: Decodable>(_ type: [T.Type])
        throws -> [T] {
            return try Array<T>.decode(try self.mapJSON())
    }
}