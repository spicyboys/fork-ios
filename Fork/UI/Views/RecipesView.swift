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
    
    @State private var searchText = ""
    @State private var isAddingRecipe = false
    
    var body: some View {
            VStack(alignment: .leading){
                //Header
                HStack{
                    Text("My Recipes")
                        .font(.largeTitle)
                        .padding()
                    Button(action: {
                        self.isAddingRecipe.toggle()
                    }, label: {
                        Text("+")
                            .font(.title3)
                            .foregroundColor(.black)
                    }).sheet(isPresented: $isAddingRecipe, onDismiss: {
                        //On dismess of AddRecipe
                    }){
                        AddRecipeView()
                    }
                }
                .padding()
                
                //Search Bar
                SearchBar(text: $searchText)
                    .padding(.top, -30)
                
                // Recipe List
                List((self.userRecipes.recipes ?? []).filter({ searchText.isEmpty ? true : $0.name.contains(searchText) }), id: \.name)
                { recipe in
                    Text(recipe.name)
                }
                .padding()
            }
        }
    }

