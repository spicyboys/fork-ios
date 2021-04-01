//
//  Ingredient.swift
//  Fork
//
//  Created by Jacob Williamson on 3/31/21.
//

import Foundation

public struct Ingredient {
    let name: String
    let amount: Double
    let measurement: String
    
    init(_ data: [String: Any]){
        self.name = data["name"] as! String;
        self.amount = data["amount"] as! Double;
        self.measurement = data["measurement"] as! String;
    }
}
