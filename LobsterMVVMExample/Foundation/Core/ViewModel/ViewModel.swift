//
//  ViewModel.swift
//  LobsterMVVMExample
//
//  Created by Jean Pierre Alary on 11/12/2019.
//  Copyright © 2019 Jean-Pierre Alary. All rights reserved.
//

import RxSwift

/**
 # Generic view model which transforms `Action` into `Result` for the View layer
 */
struct ViewModel<Action, Result> {
    private let _result: PublishSubject<Result> = PublishSubject()
    private let interactor: AnyInteractor<Action, Result>
    private let interactorScheduler: SchedulerType
    
    // MARK: - Initializer
    
    init(
        interactor: AnyInteractor<Action, Result>,
        interactorScheduler: SchedulerType = MainScheduler.asyncInstance
    ) {
        self.interactor = interactor
        self.interactorScheduler = interactorScheduler
    }
    
    // MARK: - Public
    
    /**
     # Transform `Action` into `Result` by calling interactors which hold business logic.
     
     - parameter action: `Action` triggered by the View layer
     - returns: an observable sequence of `Result` emitted on the main thread
     */
    func transform(action: Action) -> Observable<Result> {
        interactor
            .perform(action: action)
            .observeOn(interactorScheduler)
    }
}
