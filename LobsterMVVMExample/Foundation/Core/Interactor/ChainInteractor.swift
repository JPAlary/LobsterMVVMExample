//
//  ChainInteractor.swift
//  LobsterMVVMExample
//
//  Created by Jean Pierre Alary on 11/12/2019.
//  Copyright © 2019 Jean-Pierre Alary. All rights reserved.
//

import RxSwift

/**
 # Implementation of `Interactor` which has an array of interactors and flat the result.
 */
struct ChainInteractor<Action, Result>: Interactor {
    private let interactors: [AnyInteractor<Action, Result>]
    
    // MARK: - Initializer
    
    init(interactors: [AnyInteractor<Action, Result>]) {
        self.interactors = interactors
    }
    
    // MARK: - Interactor
    
    /**
     # Execute the business logic according to action given in parameter.
     
     - note: this method iterates through each elements of interactor's array and the result is flatten.
     - parameter action: `Action` generic type describing what to perform.
     - returns: an observable sequence of `Result` generic type.
     */
    func perform(action: Action) -> Observable<Result> {
        return Observable
            .from(interactors.map { $0.perform(action: action) })
            .flatMap { $0 }
    }
}
