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
import ExytePopupView

struct AddRecipeView: View {
    
    //Firestore Objects
    @ObservedObject var userRecipes: UserRecipes;
    
    //Form Fields
    @State private var title: String = ""
    @State private var defaultServings = NumbersOnly()
    @State private var totalTime = NumbersOnly()
    @State private var description: String = ""
    @State private var tags: String = ""
    @State private var ingredients: [Ingredient] = [Ingredient(["name": "russet potatoes","amount":4.0,"measurement": MeasurementType.whole]),Ingredient(["name": "olive oil","amount":2.0,"measurement": MeasurementType.tsp]),Ingredient(["name": "all-purpose flour","amount":2.0,"measurement": MeasurementType.cp])]
    @State private var directions: [Direction] = []
    
    //For Adding Ingredient Popover
    @State private var amount = NumbersOnly()
    @State private var measurementType: MeasurementType = MeasurementType.whole
    @State private var measurementTypeString: String? = nil
    @State private var name = ""
    @State private var showPopover = false
    @State private var measurementTypesAsStrings: [String] = ["tsp","tbsp","cp","qrt","pt","gl","ml","L","g","kg","lb","oz","whole","pinch"]
    
    @State private var selectedIndex = 0
    
    //For Adding Direction Popover
    
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
                    TextEditor(text: $description)
                        .foregroundColor(Color.green)
                }
                .padding(.leading)
                .frame(minWidth: 0,
                       maxWidth: .infinity,
                       minHeight: 0,
                       maxHeight: 45,
                       alignment: .topLeading)
                
                /*Tags
                 HStack(alignment: .top){
                 Text("Tags:")
                 TextEditor(text: $tags)
                 .foregroundColor(Color.blue)
                 }
                 .padding(.leading)
                 .frame(minWidth: 0,
                 maxWidth: .infinity,
                 minHeight: 0,
                 maxHeight: 45,
                 alignment: .topLeading)
                 */
                
                //******   Add Ingredient
                Button("Add Ingredient"){
                    showPopover = true
                }
                .foregroundColor(.black)
                .padding(.leading)
                
                //Ingredients
                List(self.ingredients, id: \.name){ ingredient in
                    HStack{
                        Text("\(Int(ingredient.amount)) \(ingredient.measurementType.rawValue) \(ingredient.name)")
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
            }
            .navigationBarTitleDisplayMode(.inline)
        }.popup(isPresented: $showPopover, view: {
            VStack(alignment: .center){
                //Name
                HStack{
                    Text("Name:")
                    TextField("Name", text: $name)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }.padding()
                
                //Amount
                HStack{
                    Text("Amount:")
                    TextField("Amount", text: $amount.value)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.numberPad)
                }.padding()
                
                //Measurement Type
                HStack{
                    Text("Measurement Type:")
                        .padding()
                    TextFieldWithPickerAsInputView(data: self.measurementTypesAsStrings, placeholder: "Measurement Type", selectionIndex: self.$selectedIndex, text: self.$measurementTypeString)
                        .padding()
                }
                .frame(width:.infinity, height: 35, alignment: .leading)
                
                HStack{
                    Button(action: {
                        //Cancel Add Ingredient
                        self.measurementType = MeasurementType.whole
                        self.amount.value = "0"
                        self.measurementTypeString = "whole"
                        self.name = ""
                        self.showPopover = false
                    }, label: {
                        Text("Cancel")
                            .font(.title2)
                    }).padding()
                    Button(action: {
                        //Add Ingredient
                        let ingredient: Ingredient = Ingredient(["name": self.name,"amount":Double(self.amount.value),"measurement": self.$measurementType])
                        self.ingredients.append(ingredient)
                        self.measurementType = MeasurementType.whole
                        self.amount.value = "0"
                        self.measurementTypeString = "whole"
                        self.name = ""
                        self.showPopover = false
                        showPopover = false
                    }, label: {
                        Text("Save")
                            .font(.title2)
                    }).padding()
                }
            }
            .background(Color.gray)
                        .cornerRadius(30.0)
            .frame(width: 400, height: 500, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        })
    }
}
