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
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    var body: some Scene {
        WindowGroup {
            LoginView(info: self.delegate)
        }
    }
    
}

class AppDelegate: NSObject,UIApplicationDelegate,GIDSignInDelegate,ObservableObject {
    @Published var uid = "";
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Initialize Firebase
        FirebaseApp.configure()
        
        // Setup the Google sign-in instance
        GIDSignIn.sharedInstance().clientID = FirebaseApp.app()?.options.clientID
        GIDSignIn.sharedInstance().delegate = self
        
        return true;
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        // guard against the user cancelling sign-in or mis-entering their credentials
        guard let user = user else {
            return
        }
        
        // Get the credentials form the google auth
        let credential = GoogleAuthProvider.credential(withIDToken: user.authentication.idToken, accessToken: user.authentication.accessToken)
        
        // Sign into firebase using the google credentials
        Auth.auth().signIn(with: credential) { (result, err) in
            self.uid = (result?.user.uid)!
        }
    }
}
