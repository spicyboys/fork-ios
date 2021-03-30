//
//  RecipesView.swift
//  Fork
//
//  Created by Jacob Williamson on 3/29/21.
//

import SwiftUI
import Firebase
import FirebaseFirestore

struct RecipesView: View {
    let user: User
    @ObservedObject var userRecipes: UserRecipes;
    
    init(_ user: User) {
        self.user = user;
        self.userRecipes = UserRecipes(user);
    }
    
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
            List((self.userRecipes.recipes ?? []), id: \.name)
            { recipe in
                Text(recipe.name)
            }
            }
        }
    }

