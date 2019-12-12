//
//  ArticleCollectionRepository.swift
//  LobsterMVVMExample
//
//  Created by Jean Pierre Alary on 11/12/2019.
//  Copyright © 2019 Jean-Pierre Alary. All rights reserved.
//

import RxSwift

/**
 # Abstract definition of how articles are retrieved
 */
protocol ArticleCollectionRepository {
    func getLatest() -> Observable<RepositoryResult<[Article]>>
}
