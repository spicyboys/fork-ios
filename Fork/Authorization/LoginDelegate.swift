//
//  LoginDelegate.swift
//  Fork
//
//  Created by Robert Lynch on 3/21/21.
//

import Firebase
import GoogleSignIn
import UIKit

class LoginDelegate: NSObject,UIApplicationDelegate,GIDSignInDelegate {
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        // guard against the user cancelling sign-in or mis-entering their credentials
        guard let user = user else {
            return
        }
        
        // Get the credentials form the google auth
        let credential = GoogleAuthProvider.credential(withIDToken: user.authentication.idToken, accessToken: user.authentication.accessToken)
        
        // Sign into firebase using the google credentials
        Auth.auth().signIn(with: credential)
    }
}

