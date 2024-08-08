//
//  Practice1.swift
//  iExpense
//
//  Created by Fernando Callejas on 21/06/24.
//

import SwiftData
import SwiftUI

struct Practice1: View {
    @Environment(\.modelContext) var modelContext
    
    @Query private var expenses: [ExpenseItemPractice1]
    @State private var showsAddNewItem = false
    @State private var pathStore = P1PathStore()
    @State private var expensesOrder = SortEnumP1.name
    @State private var filterExpenses = FilterEnumP1.all

    var body: some View {
        NavigationStack(path: $pathStore.path) {
            ExpensesViewP1(sortBy: expensesOrder, filterEnum: filterExpenses)
                .navigationTitle("iExpense")
                .toolbar {
                    ToolbarItem {
                        NavigationLink(value: 0) {
                            Image(systemName: "plus")
                        }
                    }
                    ToolbarItem {
                        Menu("Expenses Order", systemImage: "arrow.up.arrow.down") {
                            Picker("Expense Order", selection: $expensesOrder) {
                                Text("Name")
                                    .tag(SortEnumP1.name)
                                Text("Amount")
                                    .tag(SortEnumP1.amount)
                            }
                        }
                    }
                    ToolbarItem {
                        Menu("Filter Expenses", systemImage: "loupe") {
                            Picker("Filter", selection: $filterExpenses) {
                                ForEach(FilterEnumP1.allCases, id: \.self) { filterCase in
                                    Text(filterCase.rawValue)
                                }
                            }
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
}

@Observable
class P1PathStore {
    var path = NavigationPath()
}


#Preview {
    Practice1()
}
