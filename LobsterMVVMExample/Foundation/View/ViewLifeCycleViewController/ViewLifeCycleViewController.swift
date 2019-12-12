//
//  ViewLifeCycleViewController.swift
//  LobsterMVVMExample
//
//  Created by Jean-Pierre Alary on 12/12/2019.
//  Copyright © 2019 Jean-Pierre Alary. All rights reserved.
//

import UIKit
import RxSwift

/**
 # Subclass of `UIViewController` which exposes a `PublishSubject<ViewLifeCycle>` which follows view life cycle.
 */
class ViewLifeCycleViewController: UIViewController {
    let disposeBag = DisposeBag()
    let viewLifeCycle = PublishSubject<ViewLifeCycle>()
    
    // MARK: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewLifeCycle.onNext(.viewDidLoad)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        viewLifeCycle.onNext(.viewWillAppear)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        viewLifeCycle.onNext(.viewDidAppear)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        viewLifeCycle.onNext(.viewWillDisappear)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        viewLifeCycle.onNext(.viewDidDisappear)
    }
}
