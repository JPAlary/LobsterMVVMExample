//
//  Localization.swift
//  LobsterMVVMExample
//
//  Created by Jean Pierre Alary on 11/12/2019.
//  Copyright © 2019 Jean-Pierre Alary. All rights reserved.
//

/**
 # Abstract definition of translation management
 */
protocol Localization {
    func translate(for key: String) -> String
    func translate(for key: String, arguments: CVarArg...) -> String
}
