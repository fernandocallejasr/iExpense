//
//  AddView.swift
//  iExpense
//
//  Created by Fernando Callejas on 22/03/24.
//

import SwiftUI

struct AddView: View {
    @State private var expenseName: String = ""
    @State private var expenseType: String = "Business"
    @State private var expenseAmount: Double = 0.0

    @Environment(\.dismiss) var dismiss
    
    var expenses: Expenses
    
    let types: [String] = ["Business", "Personal"]
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Name", text: $expenseName)
                
                Picker("Type", selection: $expenseType) {
                    ForEach(types, id: \.self) { type in
                        Text(type)
                    }
                }
                
                TextField("Amount", value: $expenseAmount, format: .currency(code: "USD"))
                    .keyboardType(.decimalPad)
                
            }
            .navigationTitle("Add New Expense")
            .toolbar {
                Button("Save") {
                    let item = ExpenseItem(name: expenseName, type: expenseType, amount: expenseAmount)
                    expenses.items.append(item)
                    dismiss()
                }
            }
        }
    }
    
    func saveExpenses() {
        let encoder = JSONEncoder()
        if let encodedData = try? encoder.encode(expenses) {
            Foundation.UserDefaults.standard.set(encodedData, forKey: "expenses")
        }
        
    }
}

#Preview {
    AddView(expenses: Expenses())
}
