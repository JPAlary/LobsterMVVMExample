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
        action
            .viewWillAppear
            .map { _ in .recentTitle(self.localization.translate(for: TranslationKey.title)) }
    }
}
