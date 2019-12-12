//
//  NetworkArticleCollectionRepository.swift
//  LobsterMVVMExample
//
//  Created by Jean Pierre Alary on 11/12/2019.
//  Copyright © 2019 Jean-Pierre Alary. All rights reserved.
//

import RxSwift

/**
 # Implementation of `ArticleCollectionRepository` which use `NetworkProvider` to retreive articles
 */
struct NetworkArticleCollectionRepository: ArticleCollectionRepository {
    private let provider: NetworkProvider
    
    // MARK: - Nested
    
    struct LatestRequest: NetworkRequest {
        
        // MARK: - NetworkRequest
        
        var baseUrl: String { "https://lobste.rs" }
        
        var method: HTTPMethod { .get }
        
        var path: String { "" }
    }
    
    // MARK: - Initializer
    
    init(provider: NetworkProvider) {
        self.provider = provider
    }

    // MARK: - ArticleCollectionRepository
    
    func getLatest() -> Observable<RepositoryResult<[Article]>> {
        provider
            .send(request: LatestRequest())
            .map { result in
                switch result {
                case .success(let response):
                    if response.succeed {
                        do {
                            return .value(try response.body())
                        } catch {
                            return .error(error)
                        }
                    } else {
                        return .error(ApiAppError())
                    }
                case .failure(let error):
                    return .error(error)
                }
            }
    }
}
