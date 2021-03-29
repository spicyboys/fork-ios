//
//  UserStore.swift
//  Fork
//
//  Created by Robert Lynch on 3/29/21.
//

import Combine
import Firebase

class SessionStore: ObservableObject {
    @Published var user: User? = nil;
    var handle: AuthStateDidChangeListenerHandle?
    
    init() {
        handle = Auth.auth().addStateDidChangeListener { (auth, user) in
            if let user = user {
                self.user = user
            }  else {
                self.user = nil
            }
        }
    }

    deinit {
        if let handle = handle {
            Auth.auth().removeStateDidChangeListener(handle)
        }
    }
}
