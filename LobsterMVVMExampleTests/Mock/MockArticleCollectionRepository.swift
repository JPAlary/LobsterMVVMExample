//
//  MockArticleCollectionRepository.swift
//  LobsterMVVMExampleTests
//
//  Created by Jean Pierre Alary on 12/12/2019.
//  Copyright © 2019 Jean-Pierre Alary. All rights reserved.
//

@testable import LobsterMVVMExample
import RxSwift

struct MockArticleCollectionRepository: ArticleCollectionRepository {
    private let _getLatest: Observable<RepositoryResult<[Article]>>
    
    // MARK: - Initializer
    
    init(getLatest: Observable<RepositoryResult<[Article]>> = .never()) {
        _getLatest = getLatest
    }
    
    // MARK: - ArticleCollectionRepository
    
    func getLatest() -> Observable<RepositoryResult<[Article]>> {
        return _getLatest
    }
}
