//
//  URLSessionNetworkResponse.swift
//  LobsterMVVMExample
//
//  Created by Jean Pierre Alary on 11/12/2019.
//  Copyright © 2019 Jean-Pierre Alary. All rights reserved.
//

import Foundation

/**
 # Implementation of `NetworkResponse` which uses the native response of `URLSession` framework
 */
struct URLSessionNetworkResponse: NetworkResponse {
    private let response: HTTPURLResponse?
    private let data: Data?
    private let decoder: JSONDecoder
    
    // MARK: - Initializer
    
    init(response: URLResponse?, data: Data?) {
        self.response = response as? HTTPURLResponse
        self.data = data
        
        decoder = JSONDecoder()
    }
    
    // MARK: - NetworkResponse
    
    var statusCode: Int {
        return response?.statusCode ?? 0
    }
    
    var succeed: Bool {
        return 200..<300 ~= (response?.statusCode ?? 0)
    }
    
    func body<Result: Decodable>() throws -> Result {
        guard let data = self.data else {
            throw NetworkProviderAppError.expectedBody
        }
        
        do {
            return try decoder.decode(Result.self, from: data)
        } catch {
            throw NetworkProviderAppError.decodingFailed(error: error)
        }
    }
}
