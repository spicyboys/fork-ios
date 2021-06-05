//
//  Recipe.swift
//  Fork
//
//  Created by Robert Lynch on 3/29/21.
//

public struct Recipe {
    var title: String
    var defaultServings: Int
    var totalTime: Int
    var description: String
    var ingredients: [Ingredient]
    var directions: [Direction]
    
    init(_ data: [String: Any]) {
        self.title = data["title"] as? String ?? ""
        self.defaultServings = data["defaultServings"] as? Int ?? 1
        self.description = data["description"] as? String ?? ""
        self.totalTime = data["totalTime"] as? Int ?? 1
        self.ingredients = data["ingredients"] as? [Ingredient] ?? []
        self.directions = data["directions"] as? [Direction] ?? []
    }
}
