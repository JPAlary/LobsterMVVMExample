//
//  NetworkResponse.swift
//  LobsterMVVMExample
//
//  Created by Jean Pierre Alary on 11/12/2019.
//  Copyright © 2019 Jean-Pierre Alary. All rights reserved.
//

/**
 # Abstract definition of response from network request.
 */
protocol NetworkResponse {
    var statusCode: Int { get }
    var succeed: Bool { get }
    
    func body<Result: Decodable>() throws -> Result
}
