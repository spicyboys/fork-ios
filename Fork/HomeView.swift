//
//  HomeView.swift
//  Fork
//
//  Created by Jacob Williamson on 3/15/21.
//

import SwiftUI
import Firebase

struct HomeView: View {
    let user: User
    
    @State private var selection = 0
    
    var body: some View {
        TabView(selection: $selection){
            Text("Hi \(user.displayName!), this is the Recipes UI")
                .tabItem {
                    Text("Recipes")
                }.tag(0)
            Text("Hi \(user.displayName!), this is the Settings UI")
                .font(.title3)
                .tabItem {
                    Text("Settings")
                }.tag(1)
        }
        .font(.largeTitle)
    }

}
