//
//  StubAppError.swift
//  LobsterMVVMExampleTests
//
//  Created by Jean Pierre Alary on 12/12/2019.
//  Copyright © 2019 Jean-Pierre Alary. All rights reserved.
//

@testable import LobsterMVVMExample

struct StubAppError: AppError, Equatable {
    
    // MARK: - AppError
    
    var raw: Error? {
        return nil
    }
    
    var identifier: String {
        return "test.app.error"
    }
    
    var context: [String : String] {
        return [
            "env": "test",
        ]
    }
    
    func message(with localization: Localization) -> String {
        return "test.app.error"
    }
}
