//
//  ExpensesPractice1.swift
//  iExpense
//
//  Created by Fernando Callejas on 03/07/24.
//

import Foundation
import SwiftData

@Model
class ExpensesPractice1 {
    @Relationship(deleteRule: .cascade) var items: [ExpenseItemPractice1]
    
    init() {
        self.items = [ExpenseItemPractice1]()
    }
}
