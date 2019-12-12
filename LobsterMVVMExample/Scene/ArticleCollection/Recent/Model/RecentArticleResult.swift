//
//  RecentArticleResult.swift
//  LobsterMVVMExample
//
//  Created by Jean Pierre Alary on 11/12/2019.
//  Copyright © 2019 Jean-Pierre Alary. All rights reserved.
//

enum RecentArticleResult: Equatable {
    case loading
    case error(message: String)
    case recentTitle(String)
    case articles([RecentArticleViewModel])
    
    // MARK: - Public
    
    func value<Value>() -> Value? {
        switch self {
        case .loading:
            return true as? Value
        case .error(let value):
            return value as? Value
        case .recentTitle(let value):
            return value as? Value
        case .articles(let value):
            return value as? Value
        }
    }
    
    // MARK: - Equatable
    
    static func == (lhs: RecentArticleResult, rhs: RecentArticleResult) -> Bool {
        switch (lhs, rhs) {
        case (.loading, .loading):
            return true
        case (.error(let lhsValue), .error(let rhsValue)):
            return lhsValue == rhsValue
        case (.recentTitle(let lhsValue), .recentTitle(let rhsValue)):
            return lhsValue == rhsValue
        case (.articles(let lhsValue), .articles(let rhsValue)):
            return lhsValue == rhsValue
        default:
            return false
        }
    }
}
