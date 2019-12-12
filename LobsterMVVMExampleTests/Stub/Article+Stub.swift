//
//  Article+Stub.swift
//  LobsterMVVMExampleTests
//
//  Created by Jean Pierre Alary on 12/12/2019.
//  Copyright © 2019 Jean-Pierre Alary. All rights reserved.
//

@testable import LobsterMVVMExample

extension Article {
    static var defaultStub: Article {
        return Article(
            title: "Stub article",
            tags: ["test", "article", "stub"],
            submitterUser: Article.SubmitterUser(username: "Stub user", isAdmin: false)
        )
    }
}
