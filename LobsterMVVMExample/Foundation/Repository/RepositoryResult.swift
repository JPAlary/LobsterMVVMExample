//
//  RepositoryResult.swift
//  LobsterMVVMExample
//
//  Created by Jean Pierre Alary on 11/12/2019.
//  Copyright © 2019 Jean-Pierre Alary. All rights reserved.
//

/**
 # Enumeration of repository result possible cases
 */
enum RepositoryResult<Resource> {
    case notFound
    case value(Resource)
    case error(Error)
}
