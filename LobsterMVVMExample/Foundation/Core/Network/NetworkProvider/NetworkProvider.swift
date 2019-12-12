//
//  NetworkProvider.swift
//  LobsterMVVMExample
//
//  Created by Jean Pierre Alary on 11/12/2019.
//  Copyright © 2019 Jean-Pierre Alary. All rights reserved.
//

import RxSwift

/**
 # Abstract definition of network communication
 */
protocol NetworkProvider {
    func send(request: NetworkRequest) -> Observable<Result<NetworkResponse, NetworkProviderAppError>>
}
