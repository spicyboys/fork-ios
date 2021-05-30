//
//  ForkApp.swift
//  Fork
//
//  Created by Jacob Williamson on 3/15/21.
//

import SwiftUI
import Firebase
import UIKit

@main
struct ForkApp: App {
    
    @ObservedObject private var session: SessionStore
    
    init() {
        // Initialize Firebase
        FirebaseApp.configure()
        
        // Initialize the app session
        self.session = SessionStore()
    }

    var body: some Scene {
        WindowGroup {
            RootView().environmentObject(session)
        }
    }
}
