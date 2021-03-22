//
//  LoginView.swift
//  Fork
//
//  Created by Jacob Williamson on 3/15/21.
//

import SwiftUI

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

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
