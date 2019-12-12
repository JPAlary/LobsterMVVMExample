//
//  NSLocalization.swift
//  LobsterMVVMExample
//
//  Created by Jean Pierre Alary on 11/12/2019.
//  Copyright © 2019 Jean-Pierre Alary. All rights reserved.
//

import Foundation

/**
 # Implementation of `Localization` which use the native iOS solution `NSLocalizedString`
 */
struct NSLocalization: Localization {
    
    // MARK: - Localization
    
    func translate(for key: String) -> String {
        return NSLocalizedString(key, comment: "")
    }
    
    func translate(for key: String, arguments: CVarArg...) -> String {
        return String(format: translate(for: key), arguments: arguments)
    }
}

