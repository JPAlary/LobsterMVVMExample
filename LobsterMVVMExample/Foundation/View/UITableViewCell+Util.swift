//
//  UITableViewCell+Util.swift
//  LobsterMVVMExample
//
//  Created by Jean Pierre Alary on 12/12/2019.
//  Copyright © 2019 Jean-Pierre Alary. All rights reserved.
//

import UIKit

extension UITableViewCell {
    
    /**
     # Unique identifier describing `Self`.
     */
    static var identifier: String {
        return String(describing: self)
    }
}
