//
//  HomeView.swift
//  Fork
//
//  Created by Jacob Williamson on 3/15/21.
//

import SwiftUI
import Firebase
import SDWebImageSwiftUI

struct HomeView: View {
    let user: User
    
    @State private var selection = 0
    
    var body: some View {
            TabView(selection: $selection){
                RecipesView(user)
                    .tabItem {
                        Text("Recipes")
                        Image(systemName: "heart.fill")
                    }.tag(0)
                SettingsView(user: user)
                    .tabItem {
                        Image(systemName: "gearshape.fill")
                        Text("Settings")
                    }.tag(1)
            }
        }
    }

