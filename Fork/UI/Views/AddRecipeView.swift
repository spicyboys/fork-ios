//
//  AddRecipeView.swift
//  Fork
//
//  Created by Jacob Williamson on 3/30/21.
//

import SwiftUI
import Firebase
import FirebaseFirestore
import Combine

struct AddRecipeView: View {
    
    let user: User
    @ObservedObject var userRecipes: UserRecipes;
    @State private var title: String = ""
    @State private var defaultServings = NumbersOnly()
    @State private var totalTime = NumbersOnly()
    @State private var description: String = ""
    @State private var tags: String = ""
    @State private var ingredients: [String] = []
    @State private var directions: [String] = []
    
    
    init(_ user: User) {
        self.user = user;
        self.userRecipes = UserRecipes(user);
    }
    
    var body: some View {
        VStack(alignment: .leading){
            Text("Add a Recipe")
                .font(.largeTitle)
                .padding()
            
            HStack{
                Text("Title:")
                TextField("Title", text: $title)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }.padding(.leading)
            
            HStack{
                Text("Default Servings:")
                TextField("Default Servings", text: $defaultServings.value)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.numberPad)
            }
            .padding(.leading)
            
            HStack{
                Text("Total Time:")
                TextField("Total Time", text: $totalTime.value)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            .padding(.leading)
            
            HStack(alignment: .top){
                Text("Description:")
                TextEditor(text: $description)
                    .foregroundColor(Color.gray)
            }
            .padding(.leading)
            .frame(minWidth: 0,
                         maxWidth: .infinity,
                         minHeight: 0,
                         maxHeight: 100,
                         alignment: .topLeading
                 )
            
            HStack(alignment: .top){
                Text("Tags:")
                TextEditor(text: $tags)
                    .foregroundColor(Color.gray)
            }
            .padding(.leading)
            .frame(minWidth: 0,
                         maxWidth: .infinity,
                         minHeight: 0,
                         maxHeight: 100,
                         alignment: .topLeading
                 )
        }
    }
}
