//
//  SignInButton.swift
//  Fork
//
//  Created by Robert Lynch on 3/21/21.
//

import SwiftUI
import GoogleSignIn

struct SignInButton: UIViewRepresentable {
    func makeUIView(context: Context) -> GIDSignInButton {
        GIDSignIn.sharedInstance()?.presentingViewController = UIApplication.shared.windows.first?.rootViewController
        let button = GIDSignInButton()
        button.colorScheme = .light
        return button
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {}
}
