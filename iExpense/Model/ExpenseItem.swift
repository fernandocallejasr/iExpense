//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Fernando Callejas on 21/03/24.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}
