//
//  Interactor.swift
//  LobsterMVVMExample
//
//  Created by Jean Pierre Alary on 11/12/2019.
//  Copyright © 2019 Jean-Pierre Alary. All rights reserved.
//

import RxSwift

/**
 # Abstract definition of object which encapsulate business logic
 */
protocol Interactor {
    associatedtype Action
    associatedtype Result
    
    /**
     # Start processing the action given in parameter, apply specific business logic and returns the result
     
     - parameter action: `Action` generic parameter to describe what to process.
     - returns: an observable sequence of `Result` generic parameter.
     */
    func perform(action: Action) -> Observable<Result>
}
