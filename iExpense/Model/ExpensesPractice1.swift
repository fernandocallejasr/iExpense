//
//  ExpensesPractice1.swift
//  iExpense
//
//  Created by Fernando Callejas on 03/07/24.
//

import Foundation

@Observable
class ExpensesPractice1 {
    var items = [ExpenseItemPractice1]() {
        didSet {
            let encoder = JSONEncoder()
            if let encodedData = try? encoder.encode(items) {
                Foundation.UserDefaults.standard.set(encodedData, forKey: "ItemsPractice1")
            }
        }
    }
    
    init() {
        let decoder = JSONDecoder()
        if let itemsData = Foundation.UserDefaults.standard.data(forKey: "ItemsPractice1") {
            if let decodedData = try? decoder.decode([ExpenseItemPractice1].self, from: itemsData) {
                items = decodedData
                return
            }
        }
        
        items = [ExpenseItemPractice1]()
    }
}
