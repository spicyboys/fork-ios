//
//  ForkApp.swift
//  Fork
//
//  Created by Jacob Williamson on 3/15/21.
//

import SwiftUI
import Firebase
import GoogleSignIn
import UIKit

@main
struct ForkApp: App {
    
    @UIApplicationDelegateAdaptor(LoginDelegate.self) var loginDelegate
    
    init() {
        // Initialize Firebase
        FirebaseApp.configure()
        
        // Setup the Google sign-in instance
        GIDSignIn.sharedInstance().clientID = FirebaseApp.app()?.options.clientID
        GIDSignIn.sharedInstance().delegate = self.loginDelegate
    }

    var body: some Scene {
        WindowGroup {
            LoginView()
        }
    }
}
