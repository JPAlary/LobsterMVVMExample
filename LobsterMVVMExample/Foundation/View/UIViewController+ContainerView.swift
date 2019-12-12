//
//  UIViewController+ContainerView.swift
//  LobsterMVVMExample
//
//  Created by Jean Pierre Alary on 11/12/2019.
//  Copyright © 2019 Jean-Pierre Alary. All rights reserved.
//

import UIKit

extension UIViewController {
    
    /**
     # Add a new child view controller to `Self`
     
     - parameter viewController: `UIViewController` to add as a child view controller to `Self`.
     */
    func add(_ viewController: UIViewController) {
        addChild(viewController)
        viewController.view.frame = view.frame
        view.addSubview(viewController.view)
        
        viewController.didMove(toParent: self)
    }
}
