//
//  ExpenseItemPractice1.swift
//  iExpense
//
//  Created by Fernando Callejas on 03/07/24.
//

import Foundation
//import Observation
import SwiftData

@Model
class ExpenseItemPractice1 {
    var id = UUID()
    let name: String
    let price: Double
    let category: ExpenseCategory
    
    init(name: String, price: Double, category: ExpenseCategory) {
        self.name = name
        self.price = price
        self.category = category
    }
}
