//
//  RecentArticleViewController+Rx.swift
//  LobsterMVVMExample
//
//  Created by Jean Pierre Alary on 11/12/2019.
//  Copyright © 2019 Jean-Pierre Alary. All rights reserved.
//

import RxSwift
import RxCocoa

extension Reactive where Base: RecentArticleViewController {
    
    /**
     # Update recent label text
     */
    var recentTitle: Binder<String> {
        return Binder(base) { view, value in
            view.update(title: value)
        }
    }
    
    /**
     # Reload articles list
     */
    var reloadArticles: Binder<[RecentArticleViewModel]> {
        return Binder(base) { view, value in
            view.update(articles: value)
        }
    }
}
