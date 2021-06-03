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
import PopupView

struct AddRecipeView: View {
    
    //Firestore Objects
    @ObservedObject var userRecipes: UserRecipes;
    
    //Form Fields
    @State private var title: String = ""
    @State private var defaultServings = NumbersOnly()
    @State private var totalTime = NumbersOnly()
    @State private var description: String = ""
    @State private var tags: String = ""
    @State private var ingredients: [Ingredient] = []
    
  //Test Ingredients
  //@State private var ingredients: [Ingredient] = [Ingredient(["name": "russet potatoes","amount":4.0,"measurement": MeasurementType.whole]),Ingredient(["name": "olive oil","amount":2.0,"measurement": MeasurementType.tsp]),Ingredient(["name": "all-purpose flour","amount":2.0,"measurement": MeasurementType.cp])]
    @State private var directions: [Direction] = []
    
    //For Adding Ingredient Popover
    @State private var addingIngredient = false
    
    //For Adding Direction Popover
    @State private var addingDirection = false

    @State private var screenHeight = UIScreen.main.bounds.height
    init(_ user: User) {
        self.userRecipes = UserRecipes(user);
    }
    
    var body: some View {

            VStack(alignment: .leading){
                Group {
                //Title
                HStack{
                    Text("Title:")
                    TextField("Title", text: $title)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                .padding(.leading)
                
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
                HStack{
                    Text("Description:")
                    TextField("Description", text: $description)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                .padding(.leading)
           
                Divider()

                //Add Ingredient
                Button(action: {
                    addingIngredient = true
                }){
                    Text("Add Ingredient")
                        .font(.title2)
                }
                .padding(.leading)
                .popover(isPresented: $addingIngredient){
                    AddIngredientView(ingredients: $ingredients, addingIngredient: $addingIngredient)
                }
                .foregroundColor(Color("Font Color"))

                //Ingredients
                ScrollView(.vertical) {
                    VStack(spacing: 10) {
                        ForEach(self.ingredients, id: \.name) {ingredient in
                            Group{
                                HStack{
                                    Text("\(Int(ingredient.amount)) \(ingredient.measurementType.rawValue) \(ingredient.name)")
                                        .padding(.leading)
                                    Button(action: {
                                        //Edit Ingredient
                                    }, label: {
                                        Text("Edit")
                                    })
                                    .buttonStyle(PlainButtonStyle())
                                    Button(action: {
                                        self.ingredients = self.ingredients.filter { $0.name != ingredient.name }
                                    }, label: {
                                        Text("Delete")
                                    })
                                    .buttonStyle(PlainButtonStyle())
                                }
                                .padding(.leading)
                            }
                        }
                    }
                }
                .frame(height: CGFloat(self.ingredients.count * (Int(self.screenHeight) / 18)))
                
                
                //Add Direction
                Button(action : {
                        addingDirection = true
                }){
                    Text("Add Direction")
                        .font(.title2)
                }
                .foregroundColor(Color("Font Color"))
                .padding(.leading)
                .sheet(isPresented: $addingDirection){ AddDirectionView(directions: $directions, addingDirection: $addingDirection)}
                    
                //Directions
                ScrollView(.vertical) {
                VStack(spacing: 10) {
                    ForEach(self.directions, id: \.index) {direction in
                        Group{
                            HStack{
                                Text("\(Int(direction.index) + 1). \(direction.text)")
                                    .padding(.leading)
                                Button(action: {
                                    //Edit Ingredient
                                }, label: {
                                    Text("Edit")
                                })
                                .padding(.trailing)
                                .buttonStyle(PlainButtonStyle())
                                Button(action: {
                                    self.directions = self.directions.filter { $0.index != direction.index }
                                }, label: {
                                    Text("Delete")
                                })
                                .buttonStyle(PlainButtonStyle())
                            }.padding(.leading)
                            }
                    }
                }
                .frame(maxWidth: .infinity)
            }
                .frame(height: CGFloat(self.ingredients.count * (Int(self.screenHeight) / 18)))
                }
                
                Spacer() // THIS FIXES EVERYTHING IN NAVIGATION VIEWS FOR SOME GOD DAMN REASON APPLE FIX YOUR FUCKING SHIT
            }
            .navigationBarHidden(false)
            .navigationBarTitle("Add Recipe", displayMode: .large)
    }
}

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}


