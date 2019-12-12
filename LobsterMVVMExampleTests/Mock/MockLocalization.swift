//
//  MockLocalization.swift
//  LobsterMVVMExampleTests
//
//  Created by Jean Pierre Alary on 12/12/2019.
//  Copyright © 2019 Jean-Pierre Alary. All rights reserved.
//

@testable import LobsterMVVMExample

final class MockLocalization: Localization {
    
    // MARK: - Localization
    
    func translate(for key: String) -> String {
        return key
    }
    
    func translate(for key: String, arguments: CVarArg...) -> String {
        let argumentsSent = arguments
            .map { "\($0)" }
            .joined(separator: "-")
        
        return key + "_" + argumentsSent
    }
}
