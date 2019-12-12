//
//  RecentTitleInteractor.swift
//  LobsterMVVMExample
//
//  Created by Jean Pierre Alary on 12/12/2019.
//  Copyright © 2019 Jean-Pierre Alary. All rights reserved.
//

import RxSwift

struct RecentTitleInteractor: Interactor {
    private let localization: Localization
    
    // MARK: - Nested
    
    private enum TranslationKey {
        static let title = "scene.article.collection.recent.label.title"
    }
    
    // MARK: - Initializer
    
    init(localization: Localization) {
        self.localization = localization
    }

    // MARK: - Interactor
    
    func perform(action: RecentArticleAction) -> Observable<RecentArticleResult> {
        guard case .viewWillAppear = action else {
            return .empty()
        }

        return .just(.recentTitle(localization.translate(for: TranslationKey.title)))
    }
}
