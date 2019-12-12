//
//  AnyInteractor.swift
//  LobsterMVVMExample
//
//  Created by Jean Pierre Alary on 11/12/2019.
//  Copyright © 2019 Jean-Pierre Alary. All rights reserved.
//

import RxSwift

/**
 # Implementation of `Interactor` as type erasure for dependency injection of `Interactor` type.
 */
struct AnyInteractor<Action, Result>: Interactor {
    private let _perform: (Action) -> Observable<Result>
    
    // MARK: - Initializer
    
    init<Base: Interactor>(base: Base) where Base.Action == Action, Base.Result == Result {
        _perform = base.perform
    }
    
    // MARK: - Interactor
    
    func perform(action: Action) -> Observable<Result> {
        return _perform(action)
    }
}
