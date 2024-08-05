//
//  Practice1.swift
//  iExpense
//
//  Created by Fernando Callejas on 21/06/24.
//

import SwiftUI
import Observation

struct Practice1: View {
    @State private var expenses = ExpensesPractice1()
    @State private var showsAddNewItem = false
    @State private var pathStore = P1PathStore()

    var body: some View {
        NavigationStack(path: $pathStore.path) {
            List {
                ForEach(expenses.items) { expense in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(expense.name)
                                .font(.headline)
                            Text(expense.category.rawValue)
                                .font(.caption)
                        }
                        
                        Spacer()
                        
                        Text(expense.price, format: .currency(code: Locale.current.currency?.identifier ?? "MXN"))
                            .foregroundStyle(expense.price < 100 ? .primary : expense.price < 1000 ? Color.orange : Color.red)
                    }
                }
                .onDelete { indexSet in
                    expenses.items.remove(atOffsets: indexSet)
                }
            }
            .navigationTitle("iExpense")
            .toolbar {
//                Button("Add Expense", systemImage: "plus") {
//                    showsAddNewItem.toggle()
//                }
                
                ToolbarItem {
                    NavigationLink(value: 0) {
                        Image(systemName: "plus")
                    }
                }
            }
            .navigationDestination(for: Int.self) { num in
                AddViewPractice1(expenses: expenses)
            }
        }
        .sheet(isPresented: $showsAddNewItem, content: {
            AddViewPractice1(expenses: expenses)
        })
    }
}

@Observable
class P1PathStore {
    var path = NavigationPath()
}


#Preview {
    Practice1()
}
