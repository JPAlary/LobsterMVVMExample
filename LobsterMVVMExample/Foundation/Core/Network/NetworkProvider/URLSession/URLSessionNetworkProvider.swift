//
//  URLSessionNetworkProvider.swift
//  LobsterMVVMExample
//
//  Created by Jean Pierre Alary on 11/12/2019.
//  Copyright © 2019 Jean-Pierre Alary. All rights reserved.
//

import RxSwift

/**
 # Implementation of `NetworkProvider` which use `URLSession` framework for HTTP request/response handling
 */
struct URLSessionNetworkProvider: NetworkProvider {
    private let session: URLSession
    private let encoder: JSONEncoder
    
    // MARK: - Initializer
    
    init() {
        session = URLSession(configuration: URLSessionConfiguration.ephemeral)
        encoder = JSONEncoder()
    }
    
    // MARK: - NetworkProvider
    
    func send(request: NetworkRequest) -> Observable<Result<NetworkResponse, NetworkProviderAppError>> {
        guard let url = URL(string: request.baseUrl) else {
            return .just(.failure(NetworkProviderAppError.badUrl(request.baseUrl)))
        }
        
        guard var components = URLComponents(url: url, resolvingAgainstBaseURL: false) else {
            return .just(.failure(NetworkProviderAppError.badUrl(request.baseUrl)))
        }
        components.path = request.path
        
        guard let finalUrl = components.url else {
            return .just(.failure(NetworkProviderAppError.urlBuildingFailed(request.baseUrl + "/" + request.path)))
        }
        
        var urlRequest = URLRequest(url: finalUrl)
        urlRequest.httpMethod = request.method.rawValue
        request.headers.forEach { urlRequest.addValue($0.value, forHTTPHeaderField: $0.key) }
        urlRequest.httpBody = request.buildBody(with: encoder)
        
        return .create { observer in
            let task = self.session.dataTask(with: urlRequest) { (data, response, error) in
                if let error = error {
                    observer.onNext(.failure(NetworkProviderAppError.networkError(error)))
                } else {
                    observer.onNext(.success(URLSessionNetworkResponse(response: response, data: data)))
                }
                
                observer.onCompleted()
            }
            
            task.resume()
            
            return Disposables.create {
                task.cancel()
            }
        }
    }
}

