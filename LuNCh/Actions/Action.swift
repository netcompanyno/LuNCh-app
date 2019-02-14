//
//  action.swift
//  LuNCh
//
//  Created by André Bellefine Lindeløff on 13.02.2019.
//  Copyright © 2019 Netcompany. All rights reserved.
//

import Foundation
import ReSwift
import ReSwiftThunk
import Firebase
import FirebaseDatabase


public func fetchUsers() -> ThunkAction<Any> {
    

    return ThunkAction(
        action: { (dispatch, getState) in
            dispatch(FetchUserAction(data: .loading))
            
            let ref = Database.database().reference()
            
            ref.observe(DataEventType.value, with: { (snapshot) in
                let postDict = snapshot.value as? [String : Any]
                print(postDict)
                guard let data = postDict else {
                    dispatch(FetchUserAction(data: .error(NSError(domain: "KEK NOE GIKK GALT", code: 999, userInfo: nil))))
                    return
                }
                dispatch(FetchUserAction(data: .success(data)))
            })
            
    }
        
    )
}

struct FetchUserAction: Action {
    let data: Loadable<[String : Any]>
    
}
