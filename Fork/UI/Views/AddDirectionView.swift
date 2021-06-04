//
//  AddDirectionView.swift
//  Fork
//
//  Created by Jacob Williamson on 4/6/21.
//

import SwiftUI

struct AddDirectionView: View {
    
    @State private var text = ""
    
    @Binding var directions: [Direction]
    @Binding var addingDirection: Bool
    
    var body: some View {
        VStack{
            Text("Add a Direction")
                .font(.largeTitle)
                .padding()
            Spacer()
            HStack(alignment: .top, spacing: 10){
                Text("\(directions.count + 1). ")
                    .padding(.leading)
                    .padding(.top, 8)
                    .font(.title3)
                //TextField("Direction", text: $text)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                TextEditor(text: $text)
                    .padding(.leading)
                Spacer()
            }
            
            HStack{
                Button(action: {
                    self.addingDirection = false
                }, label: {
                    Text("Cancel")
                        .font(.title2)
                })
                .foregroundColor(Color("Font Color"))
                .padding()
            
                Button(action: {
                    let direction: Direction = Direction(["index": self.directions.count, "text": self.text])
                    directions.append(direction)
                    self.addingDirection = false
                }, label: {
                    Text("Add")
                        .font(.title2)
                })
                .foregroundColor(Color("Font Color"))
                .padding()
            }
            
            Spacer()
        }
    }
}

