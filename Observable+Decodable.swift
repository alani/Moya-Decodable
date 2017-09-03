//
//  Observable+Decodable.swift
//  Moya-Decodable
//
//  Created by Ahmed Alani.
//  Copyright © 2017 Ahmed Alani. All rights reserved.
//

import Foundation
import RxSwift
import Decodable
import Moya

public extension ObservableType where E == Moya.Response {
    public func map<T: Decodable>(_ type: T.Type)
        -> Observable<T> {
            return flatMap { (response : Response)
                -> Observable<T> in
                return Observable.just(try response.map(type))
            }
    }
    
    public func map<T: Decodable>(_ type: [T.Type])
        -> Observable<[T]> {
            return flatMap { (response : Response)
                -> Observable<[T]> in
                return Observable.just(try response.map(type))
            }
    }
}