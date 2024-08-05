//
//  Expenses.swift
//  iExpense
//
//  Created by Fernando Callejas on 21/03/24.
//

import Foundation

@Observable
class Expenses: Codable {
    var items = [ExpenseItem]() {
        didSet {
            let encoder = JSONEncoder()
            if let encodedData = try? encoder.encode(items) {
                Foundation.UserDefaults.standard.set(encodedData, forKey: "items")
            }
        }
    }
    
    
    init() {
        let decoder = JSONDecoder()
        
        if let fetchedData = Foundation.UserDefaults.standard.data(forKey: "items") {
            if let decodedItems = try? decoder.decode([ExpenseItem].self, from: fetchedData) {
                items = decodedItems
                return
            }
        }
        
        items = []
    }
}
