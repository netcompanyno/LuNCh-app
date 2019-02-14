//
//  Reducers.swift
//  LuNCh
//
//  Created by André Bellefine Lindeløff on 13.02.2019.
//  Copyright © 2019 Netcompany. All rights reserved.
//

import Foundation
import ReSwift


func mainReducer(action: Action, state: MainState?) -> MainState {
    var state = state ?? MainState()

    guard let fetchUserAction = action as? FetchUserAction else {
        
        return state
    }
    
    state.users = fetchUserAction.data
    
    
    return state
}
