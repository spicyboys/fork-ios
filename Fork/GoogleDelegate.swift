//
//  GoogleDelegate.swift
//  Fork
//
//  Created by Jacob Williamson on 3/15/21.
//

import GoogleSignIn

class GoogleDelegate: NSObject, GIDSignInDelegate, ObservableObject {
    @Published var signedIn: Bool = false
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let error = error {
            if (error as NSError).code == GIDSignInErrorCode.hasNoAuthInKeychain.rawValue {
                    print("The user has not signed in before or they have since signed out.")
            } else {
                print("\(error.localizedDescription)")
            }
            return
        }
        print("Successful sign-in.")
        signedIn = true
    }
}
