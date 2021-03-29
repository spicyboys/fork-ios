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
    
    var body: some View {
        Text(user.displayName!)
    }
}
