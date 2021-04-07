//
//  Ingredient.swift
//  Fork
//
//  Created by Jacob Williamson on 3/31/21.
//

import Foundation

enum MeasurementType: String, Equatable, Identifiable, CaseIterable {
    case tsp
    case tbsp
    case cp
    case qrt
    case pt
    case gl
    case ml
    case L
    case g
    case kg
    case lb
    case oz
    case whole
    case pinch
    
    var id: String { self.rawValue }
    
    static func withLabel(_ label: String) -> MeasurementType? {
            return self.allCases.first{ "\($0)" == label }
        }
}
    
public struct Ingredient {
    let name: String
    let amount: Double
    let measurementType: MeasurementType
    
    init(_ data: [String: Any]){
        self.name = data["name"] as! String;
        self.amount = data["amount"] as! Double;
        self.measurementType = data["measurement"] as! MeasurementType;
    }
}
