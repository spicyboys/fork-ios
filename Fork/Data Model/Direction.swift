//
//  Direction.swift
//  Fork
//
//  Created by Jacob Williamson on 3/31/21.
//

import Foundation

public struct Direction {
    let index: Int
    let text: String
    
    init(_ data: [String: Any]){
        self.index = data["index"] as! Int;
        self.text = data["text"] as! String;
    }
}
