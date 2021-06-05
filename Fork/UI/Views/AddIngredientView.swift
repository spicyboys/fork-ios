//
//  AddIngredientView.swift
//  Fork
//
//  Created by Jacob Williamson on 4/6/21.
//

import SwiftUI

struct AddIngredientView: View {
    
    
    @State private var amount = NumbersOnly()
    @State private var measurementType: MeasurementType = MeasurementType.whole
    @State private var measurementTypeString: String? = nil
    @State private var name = ""
    @State private var showPopover = false
    @State private var measurementTypesAsStrings: [String] = ["tsp","tbsp","cp","qrt","pt","gl","ml","L","g","kg","lb","oz","whole","pinch"]
    
    @State private var selectedIndex = 0
    
    @Binding var ingredients: [Ingredient]
    @Binding var addingIngredient: Bool
    
    var body: some View {
        VStack(alignment: .center){
            Group{
                
            Text("Add Ingredient")
                .font(.largeTitle)
                .padding()
                
            //Name
            HStack{
                Text("Name:")
                TextField("Name", text: $name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            .padding()
            
            //Amount
            HStack{
                Text("Amount:")
                TextField("Amount", text: $amount.value)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.numberPad)
            }
            .padding()
            
            //Measurement Type
            Group{
                HStack{
                    Text("Measurement Type:")
                        .padding()
                    TextFieldWithPickerAsInputView(data: self.measurementTypesAsStrings, placeholder: "Measurement Type", selectionIndex: self.$selectedIndex, text: self.$measurementTypeString)
                        .frame(width: .infinity, height: 80, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/) //need to fix this later
                }
            }
            
            //Cancel and Add
            HStack{
                
                //Cancel
                Button(action: {
                    self.addingIngredient = false
                }, label: {
                    Text("Cancel")
                        .font(.title2)
                })
                .foregroundColor(.black)
                .padding()
                
                //Add Ingredient
                Button(action: {
                    //Add Ingredient
                    let ingredient: Ingredient = Ingredient(["name": self.name,"amount":Double(self.amount.value) ?? 0.0,"measurement": MeasurementType.withLabel(self.measurementTypeString ?? MeasurementType.whole.rawValue) ?? MeasurementType.whole])
                    ingredients.append(ingredient)
                    self.addingIngredient = false
                }, label: {
                    Text("Add")
                        .font(.title2)
                })
                .padding()
            }
        }
            
        Spacer()
    }
    }
}
