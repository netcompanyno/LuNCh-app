//
//  ViewController.swift
//  LuNCh
//
//  Created by Lars Dahl on 10/12/2018.
//  Copyright © 2018 Netcompany. All rights reserved.
//

import UIKit
import ReSwift

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        mainStore.subscribe(self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        mainStore.dispatch(fetchUsers())
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        mainStore.unsubscribe(self)
    }

}

extension ViewController: StoreSubscriber{
    func newState(state: MainState) {
        print(state.users)
    }
    
}

