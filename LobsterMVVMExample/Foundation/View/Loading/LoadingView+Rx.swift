//
//  LoadingView+Rx.swift
//  LobsterMVVMExample
//
//  Created by Jean Pierre Alary on 11/12/2019.
//  Copyright © 2019 Jean-Pierre Alary. All rights reserved.
//

import RxSwift
import RxCocoa

extension Reactive where Base: LoadingView {
    
    /**
     # Show or remove the loading state
     */
    var loading: Binder<Bool> {
        return Binder(base) { view, value in
            if value {
                let viewController = LoadingViewController()
                view.add(viewController)
                view.loadingViewController = viewController
            } else {
                view.loadingViewController?.remove()
            }
        }
    }
}
