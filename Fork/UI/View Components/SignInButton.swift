//
//  SignInButton.swift
//  Fork
//
//  Created by Robert Lynch on 3/21/21.
//

import SwiftUI
import AuthenticationServices

struct SignInButton: UIViewRepresentable {
    typealias UIViewType = ASAuthorizationAppleIDButton

    func makeUIView(context: Context) -> UIViewType {
        return ASAuthorizationAppleIDButton()
    }

    func updateUIView(_ uiView: UIViewType, context: Context) {
    }
}
