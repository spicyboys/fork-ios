//
//  RootView.swift
//  Fork
//
//  Created by Robert Lynch on 3/29/21.
//

import SwiftUI

struct RootView: View {
    @EnvironmentObject var session: SessionStore

    var body: some View {
        if session.user == nil {
            LoginView()
        } else {
            //HomeView(user: session.user!)
            RecipesView(session.user!)
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
