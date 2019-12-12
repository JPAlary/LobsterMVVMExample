//
//  RecentArticleViewModel.swift
//  LobsterMVVMExample
//
//  Created by Jean Pierre Alary on 11/12/2019.
//  Copyright © 2019 Jean-Pierre Alary. All rights reserved.
//

struct RecentArticleViewModel: Equatable {
    private let localization: Localization
    private let article: Article
    
    // MARK: - Nested
    
    private enum Constant {
        static let tagSeparator = ", "
        
        enum TranslationKey {
            static let author = "scene.article.collection.recent.cell.label.author"
        }
    }
    
    // MARK: - Initializer
    
    init(localization: Localization, article: Article) {
        self.localization = localization
        self.article = article
    }
    
    // MARK: - Public
    
    var title: String {
        return article.title
    }
    
    var tags: String {
        return article.tags.joined(separator: Constant.tagSeparator)
    }
    
    var authorName: String {
        return localization.translate(for: Constant.TranslationKey.author, arguments: article.submitterUser.username)
    }
    
    // MARK: - Equatable
    
    static func == (lhs: RecentArticleViewModel, rhs: RecentArticleViewModel) -> Bool {
        return true
    }
}
