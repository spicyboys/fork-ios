//
//  NumberOnly.swift
//  Fork
//
//  Created by Jacob Williamson on 3/31/21.
//
import Combine

class NumbersOnly: ObservableObject {
    @Published var value = "" {
        didSet {
            let filtered = value.filter { $0.isNumber }
            
            if value != filtered {
                value = filtered
            }
        }
    }
}
