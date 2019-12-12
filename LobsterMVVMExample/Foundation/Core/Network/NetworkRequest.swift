//
//  NetworkRequest.swift
//  LobsterMVVMExample
//
//  Created by Jean Pierre Alary on 11/12/2019.
//  Copyright © 2019 Jean-Pierre Alary. All rights reserved.
//

import Foundation

/**
 # Abstract definition of request send through network process
 */
protocol NetworkRequest {
    var baseUrl: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var headers: [String: String] { get }
    
    func buildBody(with encoder: JSONEncoder) -> Data?
}

extension NetworkRequest {
    
    var headers: [String: String] {
        return [
            "Accept": "application/json",
        ]
    }
    
    func buildBody(with encoder: JSONEncoder) -> Data? {
        return nil
    }
}
