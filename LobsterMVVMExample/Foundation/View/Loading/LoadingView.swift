//
//  LoadingView.swift
//  LobsterMVVMExample
//
//  Created by Jean Pierre Alary on 11/12/2019.
//  Copyright © 2019 Jean-Pierre Alary. All rights reserved.
//

import UIKit

/**
 # Contract to be able to have a loading state view
 */
protocol LoadingView: UIViewController {
    var loadingViewController: LoadingViewController? { get set }
}
