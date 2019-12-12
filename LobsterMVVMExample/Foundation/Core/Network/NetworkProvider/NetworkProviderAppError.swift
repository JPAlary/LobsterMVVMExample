//
//  NetworkProviderAppError.swift
//  LobsterMVVMExample
//
//  Created by Jean Pierre Alary on 11/12/2019.
//  Copyright © 2019 Jean-Pierre Alary. All rights reserved.
//

/**
 # Implementation of `AppError` for errors happening in `NetworkProvider` layer
 */
enum NetworkProviderAppError: AppError {
    case expectedBody
    case decodingFailed(error: Error)
    case badUrl(String)
    case urlBuildingFailed(String)
    case networkError(Error)
    case apiError
    
    // MARK: - AppError
    
    var raw: Error? {
        switch self {
        case .decodingFailed(let error):
            return error
        case .networkError(let error):
            return error
        case .expectedBody, .badUrl, .urlBuildingFailed, .apiError:
            return nil
        }
    }
    
    var identifier: String {
        switch self {
        case .expectedBody:
            return "app.error.core.network.expected_body"
        case .decodingFailed:
            return "app.error.core.network.decoding_failed"
        case .badUrl:
            return "app.error.core.network.bad_url"
        case .urlBuildingFailed:
            return "app.error.core.network.url_building_failed"
        case .networkError:
            return "app.error.core.network.network_error"
        case .apiError:
            return "app.error.core.network.api_error"
        }
    }
    
    var context: [String: String] {
        switch self {
        case .expectedBody, .apiError:
            return [:]
        case .decodingFailed(let error):
            return [
                "raw": error.localizedDescription,
            ]
        case .badUrl(let url):
            return [
                "url": url,
            ]
        case .urlBuildingFailed(let url):
            return [
                "url": url,
            ]
        case .networkError(let error):
            return [
                "raw": error.localizedDescription,
            ]
        }
    }
    
    func message(with localization: Localization) -> String {
        switch self {
        case .expectedBody, .decodingFailed, .badUrl, .urlBuildingFailed, .apiError:
            return localization.translate(for: "app.error.default")
        case .networkError:
            return localization.translate(for: "app.error.network")
        }
    }
    
    // MARK: - Error
    
    var localizedDescription: String {
        switch self {
        case .expectedBody:
            return "app.error.core.network.expected_body"
        case .decodingFailed(let error):
            return error.localizedDescription
        case .badUrl:
            return "app.error.core.network.bad_url"
        case .urlBuildingFailed:
            return "app.error.core.network.url_building_failed"
        case .networkError(let error):
            return error.localizedDescription
        case .apiError:
            return "app.error.core.network.api_error"
        }
    }
}
