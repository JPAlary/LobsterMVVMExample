//
//  ApiAppError.swift
//  LobsterMVVMExample
//
//  Created by Jean Pierre Alary on 11/12/2019.
//  Copyright © 2019 Jean-Pierre Alary. All rights reserved.
//

/**
 # Implementation of `AppError` for error returns by the api
 
 # TODO:
    - Create APIError object which represents the api error body sent
    - `ApiAppError` should received it and according to values set the different properties of `AppError`
 */
struct ApiAppError: AppError {
    
    // MARK: - AppError
    
    var raw: Error? {
        return nil
    }
    
    var context: [String: String] {
        return [:]
    }
    
    var identifier: String {
        return "app.error.api"
    }
    
    func message(with localization: Localization) -> String {
        return localization.translate(for: "app.error.default")
    }
    
    // MARK: - Error
    
    var localizedDescription: String {
        return "app.error.default"
    }
}
