//
//  RecipesView.swift
//  Fork
//
//  Created by Jacob Williamson on 3/29/21.
//

import SwiftUI
import Firebase

struct RecipesView: View {
    let user: User
    
    var body: some View {
        VStack{
            HStack {
                Text("My Recipes")
                    .font(.largeTitle)
                Button(action: {
                    //Switch to AddRecipeView
                }, label: {
                    Text("+")
                        .font(.title3)
                        .foregroundColor(.black)
                })
            }
            //list(0..<5){ item in
            
        }
    }
}
