//
//  Recipe.swift
//  Fork
//
//  Created by Robert Lynch on 3/29/21.
//

public struct Recipe {
    let name: String
    
    init(_ data: [String: Any]) {
        self.name = data["name"] as! String;
    }
}
