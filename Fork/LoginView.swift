//
//  LoginView.swift
//  Fork
//
//  Created by Jacob Williamson on 3/15/21.
//


import SwiftUI
import GoogleSignIn

struct LoginView: View {
        
    var body: some View {
        VStack{
            Text("Welcome to Fork")
                .font(.largeTitle)
                .padding()
            Text("Sign In Below")
            SignInButton()
        }
    }
}

struct SignInButton: UIViewRepresentable {
    func makeUIView(context: Context) -> GIDSignInButton {
        GIDSignIn.sharedInstance()?.presentingViewController = UIApplication.shared.windows.first?.rootViewController
        let button = GIDSignInButton()
        button.colorScheme = .light
        return button
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {}
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
