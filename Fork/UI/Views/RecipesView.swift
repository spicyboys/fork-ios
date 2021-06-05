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
        NavigationView{
            VStack(alignment: .leading){
                //Header
                HStack{
                    Text("My Recipes")
                        .font(.largeTitle)
                        .padding()
                    NavigationLink(destination: AddRecipeView(user, isAddingRecipe: self.$isAddingRecipe) , isActive: self.$isAddingRecipe) { EmptyView() }
                    Button(action: {
                        self.isAddingRecipe = true
                    }, label: {
                        Text("+")
                            .font(.largeTitle)
                    })
                }
                .padding(.bottom)
                .padding(.leading)
                
                //Search Bar
                SearchBar(text: $searchText)
                    .padding(.top, -30)
                
                // Recipe List
                List((self.userRecipes.recipes ?? []).filter({ searchText.isEmpty ? true : $0.title.contains(searchText) }), id: \.title)
                { recipe in
                    Text(recipe.title)
                }.listStyle(PlainListStyle())
            
            }.navigationBarHidden(true)
            .navigationBarTitle("", displayMode: .inline)
        }
    }
    
    private func link<Destination: View>(label: String, destination: Destination) -> some View {
            return NavigationLink(destination: destination) {
                HStack {
                    Text(label)
                        .font(.largeTitle)
                }
            }
        }

}
