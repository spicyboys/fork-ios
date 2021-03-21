//
//  LoginView.swift
//  Fork
//
//  Created by Jacob Williamson on 3/15/21.
//


import SwiftUI
import GoogleSignIn

struct LoginView: View {
    
    @ObservedObject var info : AppDelegate
    
    var body: some View {
        VStack{
            Text("Welcome to Fork")
                .font(.largeTitle)
                .padding()
            Text("Sign In Below")
            Button(action: {
                GIDSignIn.sharedInstance()?.presentingViewController = UIApplication.shared.windows.first?.rootViewController
                GIDSignIn.sharedInstance()?.signIn()
            }){
                Text("Sign In with Google")
            }.padding().background(Color.gray).foregroundColor(.white)
        }
    }
}

//struct LoginView_Previews: PreviewProvider {
//    static var previews: some View {
//        LoginView()
//    }
//}

