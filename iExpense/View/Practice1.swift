//
//  Practice1.swift
//  iExpense
//
//  Created by Fernando Callejas on 21/06/24.
//

import SwiftData
import SwiftUI
//import Observation

struct Practice1: View {
    @Environment(\.modelContext) var modelContext
    
    @Query private var expenses: [ExpenseItemPractice1]
    @State private var showsAddNewItem = false
    @State private var pathStore = P1PathStore()

    var body: some View {
        NavigationStack(path: $pathStore.path) {
            List {
                ForEach(expenses) { expense in
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
                    deleteItem(offsets: indexSet)
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
                AddViewPractice1()
            }
        }
        .sheet(isPresented: $showsAddNewItem, content: {
            AddViewPractice1()
        })
    }
    
    func deleteItem(offsets: IndexSet) {
        for offset in offsets {
            let item = expenses[offset]
            modelContext.delete(item)
        }
    }
}

@Observable
class P1PathStore {
    var path = NavigationPath()
}


#Preview {
    Practice1()
}
