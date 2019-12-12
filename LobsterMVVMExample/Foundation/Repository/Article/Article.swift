//
//  Article.swift
//  LobsterMVVMExample
//
//  Created by Jean Pierre Alary on 11/12/2019.
//  Copyright © 2019 Jean-Pierre Alary. All rights reserved.
//

struct Article: Decodable {
    let title: String
    let tags: [String]
    let submitterUser: SubmitterUser
    
    // MARK: - Nested
    
    enum CodingKeys: String, CodingKey {
        case title
        case tags
        case submitterUser = "submitter_user"
    }
    
    struct SubmitterUser: Decodable {
        let username: String
        let isAdmin: Bool
        
        // MARK: - Nested
        
        enum CodingKeys: String, CodingKey {
            case username
            case isAdmin = "is_admin"
        }
    }
}
