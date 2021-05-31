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

    init(_ user: User) {
        self.userRecipes = UserRecipes(user);
    }
    
    var body: some View {
        ZStack{
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
                    TextField("Description", text: $description)
                }
                .padding(.leading)
           
                //Add Ingredient
                Button("Add Ingredient"){
                    addingIngredient = true
                    print("clicked button")
                }
                .foregroundColor(.black)
                .padding(.leading)
                .sheet(isPresented: $addingIngredient){ AddIngredientView(ingredients: $ingredients, addingIngredient: $addingIngredient) }
                
                //Ingredients
                if (ingredients.count > 0) {
                List(self.ingredients, id: \.name){ ingredient in
                    HStack{
                        Text("\(Int(ingredient.amount)) \(ingredient.measurementType.rawValue) \(ingredient.name)")
                        Button(action: {
                            //Edit Ingredient
                        }, label: {
                            Text("Edit")
                                .foregroundColor(.black)
                        })
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
                }
                
                //Add Direction
                Button("Add Direction"){
                    addingDirection = true
                    print("clicked button")
                }
                .foregroundColor(.black)
                .padding(.leading)
                .sheet(isPresented: $addingDirection){ AddDirectionView(directions: $directions, addingDirection: $addingDirection)}
                
                //Directions
                List(self.directions, id: \.index){ direction in
                    HStack{
                        Text("\(Int(direction.index)). \(direction.text)")
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
                            self.directions = self.directions.filter { $0.index != direction.index }
                        }, label: {
                            Text("Delete")
                                .foregroundColor(.black)
                        })
                        .buttonStyle(PlainButtonStyle())
                    }
                }

            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
