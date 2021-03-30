//
//  SettingsView.swift
//  Fork
//
//  Created by Jacob Williamson on 3/29/21.
//

import SwiftUI
import Firebase

struct SettingsView: View {
    let user: User
    
    var body: some View {
        Text("Hi \(user.displayName!), this is the Settings UI")
            .padding()
            .font(.title2)
    }
}

