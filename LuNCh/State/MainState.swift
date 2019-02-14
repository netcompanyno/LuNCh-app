//
//  MainState.swift
//  LuNCh
//
//  Created by André Bellefine Lindeløff on 13.02.2019.
//  Copyright © 2019 Netcompany. All rights reserved.
//

import Foundation
import ReSwift

enum Loadable<T> {
    case initial
    case loading
    case success(T)
    case error(Error)
}

struct MainState: StateType {

    var users: Loadable<[String: Any]> = .initial
}
