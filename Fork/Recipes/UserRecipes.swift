//
//  UserRecipes.swift
//  Fork
//
//  Created by Robert Lynch on 3/29/21.
//

import Firebase
import FirebaseFirestore

class UserRecipes: ObservableObject {
    init(_ user: User) {
        Firestore.firestore()
            .collection("recipes")
            .whereField("author_uid", isEqualTo: user.uid)
            .getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    self.recipes = querySnapshot!
                        .documents
                        .map( { (document) in Recipe(document.data()) })
                }
        }
    }

    @Published var recipes: [Recipe]?
}
