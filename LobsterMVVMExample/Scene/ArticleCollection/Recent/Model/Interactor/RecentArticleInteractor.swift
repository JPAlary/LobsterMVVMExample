//
//  RecentArticleInteractor.swift
//  LobsterMVVMExample
//
//  Created by Jean Pierre Alary on 11/12/2019.
//  Copyright © 2019 Jean-Pierre Alary. All rights reserved.
//

import RxSwift

struct RecentArticleInteractor: Interactor {
    private let repository: ArticleCollectionRepository
    private let localization: Localization
    
    // MARK: - Nested
    
    private enum Constant {
        enum TranslationKey {
            static let emptyCollection = "scene.article.collection.recent.empty_collection"
        }
    }
    
    // MARK: - Initializer
    
    init(repository: ArticleCollectionRepository, localization: Localization) {
        self.repository = repository
        self.localization = localization
    }
    
    // MARK: - Interactor
    
    func perform(action: RecentArticleAction) -> Observable<RecentArticleResult> {
        switch action {
        case .viewWillAppear:
            return repository
                .getLatest()
                .map { result in
                    switch result {
                    case .value(let articles):
                        return .articles(articles.map { RecentArticleViewModel(localization: self.localization, article: $0) })
                    case .notFound:
                        return .error(message: self.localization.translate(for: Constant.TranslationKey.emptyCollection))
                    case .error(let error):
                        guard let appError = error as? AppError else {
                            fatalError("\(#function) - error from repository should be instance of `AppError`")
                        }
                        return .error(message: appError.message(with: self.localization))
                    }
                }
                .startWith(.loading)
        }
    }
}
