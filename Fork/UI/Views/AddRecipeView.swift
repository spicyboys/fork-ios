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
    @State private var ingredients: [Ingredient] = [Ingredient(["name": "russet potatoes","amount":4.0,"measurement": "whole"]),Ingredient(["name": "olive oil","amount":2.0,"measurement": "tbsp"]),Ingredient(["name": "all-purpose flour","amount":2.0,"measurement": "cups"])]
    
    @State private var directions: [Direction] = []
    
    
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
                    .keyboardType(.numberPad)
            }
            .padding(.leading)
            
            HStack(alignment: .top){
                Text("Description:")
                TextEditor(text: $description)
                    .foregroundColor(Color.green)
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
                    .foregroundColor(Color.blue)
            }
            .padding(.leading)
            .frame(minWidth: 0,
                         maxWidth: .infinity,
                         minHeight: 0,
                         maxHeight: 100,
                         alignment: .topLeading
                 )
                    
            List(self.ingredients, id: \.name){ ingredient in
                HStack{
                    Text("\(Int(ingredient.amount)) \(ingredient.measurement) \(ingredient.name)")
                        .padding(.trailing)
                    Button(action: {
                        //Edit Ingredient
                    }, label: {
                        Text("Edit")
                            .foregroundColor(.black)
                    })
                    .padding(.trailing)
                    .buttonStyle(PlainButtonStyle())
                    Button(action: {
                        //Delete Ingredient
                    }, label: {
                        Text("Delete")
                            .foregroundColor(.black)
                    })
                    .buttonStyle(PlainButtonStyle())
                }
            }
        }
        
    }
}
