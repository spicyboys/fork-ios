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
    
    @State private var title: String = ""
    @State private var defaultServings = NumbersOnly()
    @State private var totalTime = NumbersOnly()
    @State private var description: String = ""
    @State private var tags: String = ""
    @State private var ingredients: [Ingredient] = [Ingredient(["name": "russet potatoes","amount":4.0,"measurement": "whole"]),Ingredient(["name": "olive oil","amount":2.0,"measurement": "tbsp"]),Ingredient(["name": "all-purpose flour","amount":2.0,"measurement": "cups"])]
    
    @State private var directions: [Direction] = []
    
    @State private var showPopover = false
    
    init(_ user: User) {
        self.user = user;
    }
    
    var body: some View {
        VStack(alignment: .leading){
            
            //Header
            Text("Add a Recipe")
                .font(.largeTitle)
                .padding()
            
            //Title
            HStack{
                Text("Title:")
                TextField("Title", text: $title)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }.padding(.leading)
            
            //Default Servings
            HStack{
                Text("Default Servings:")
                TextField("Default Servings", text: $defaultServings.value)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.numberPad)
            }
            .padding(.leading)
            
            //Total Time
            HStack{
                Text("Total Time:")
                TextField("Total Time", text: $totalTime.value)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.numberPad)
            }
            .padding(.leading)
            
            //Description
            HStack(alignment: .top){
                Text("Description:")
                TextEditor(text: $description)
                    .foregroundColor(Color.green)
            }
            .padding(.leading)
            .frame(minWidth: 0,
                   maxWidth: .infinity,
                   minHeight: 0,
                   maxHeight: 60,
                   alignment: .topLeading)
            
            //Tags
            HStack(alignment: .top){
                Text("Tags:")
                TextEditor(text: $tags)
                    .foregroundColor(Color.blue)
            }
            .padding(.leading)
            .frame(minWidth: 0,
                   maxWidth: .infinity,
                   minHeight: 0,
                   maxHeight: 60,
                   alignment: .topLeading)
            
            //Ingredients
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
                        self.ingredients = self.ingredients.filter { $0.name != ingredient.name }
                    }, label: {
                        Text("Delete")
                            .foregroundColor(.black)
                    })
                    .buttonStyle(PlainButtonStyle())
                }
            }
            Button("Add Ingredient"){
                showPopover = true
            }
            .popover(isPresented: $showPopover) {
                HStack(alignment: .top){
                    Text("Amount")
                        .font(.headline)
                        .padding()
                }
            }
        }
        
    }
}
