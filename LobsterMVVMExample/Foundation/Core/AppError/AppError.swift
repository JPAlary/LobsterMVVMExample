//
//  AppError.swift
//  LobsterMVVMExample
//
//  Created by Jean Pierre Alary on 11/12/2019.
//  Copyright © 2019 Jean-Pierre Alary. All rights reserved.
//

/**
 # Abstract definition of application error thrown in any architecture layer
 */
protocol AppError: Error {
    var identifier: String { get }
    var raw: Error? { get }
    var context: [String: String] { get }
    
    func message(with localization: Localization) -> String
}
