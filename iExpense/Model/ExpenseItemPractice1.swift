//
//  ExpenseItemPractice1.swift
//  iExpense
//
//  Created by Fernando Callejas on 03/07/24.
//

import Foundation
import Observation

struct ExpenseItemPractice1: Identifiable, Codable {
    var id = UUID()
    let name: String
    let price: Double
    let category: ExpenseCategory
}
