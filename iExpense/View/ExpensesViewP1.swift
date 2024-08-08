//
//  ExpensesViewP1.swift
//  iExpense
//
//  Created by Fernando Callejas on 07/08/24.
//

import SwiftData
import SwiftUI

struct ExpensesViewP1: View {
    @Environment(\.modelContext) var modelContext
    
    @Query private var expenses: [ExpenseItemPractice1]
    
    init(sortBy: SortEnumP1, filterEnum: FilterEnumP1) {
        var sortDesciptor: [SortDescriptor<ExpenseItemPractice1>]
        
        if sortBy == .amount {
             sortDesciptor = [
                SortDescriptor(\ExpenseItemPractice1.price, order: .reverse),
                SortDescriptor(\ExpenseItemPractice1.name, order: .forward)
            ]
        } else {
            sortDesciptor = [
                SortDescriptor(\ExpenseItemPractice1.name, order: .forward),
                SortDescriptor(\ExpenseItemPractice1.price, order: .reverse)
            ]
        }
        
        if filterEnum == FilterEnumP1.all {
            _expenses = Query(filter: #Predicate<ExpenseItemPractice1> { expense in
                expense.categoryString == "Business" || expense.categoryString == "Personal"
            }, sort: sortDesciptor)
        } else if filterEnum == FilterEnumP1.business {
            _expenses = Query(filter: #Predicate<ExpenseItemPractice1> { expense in
                expense.categoryString == "Business"
            }, sort: sortDesciptor)
        } else if filterEnum == FilterEnumP1.personal {
            _expenses = Query(filter: #Predicate<ExpenseItemPractice1> { expense in
                expense.categoryString == "Personal"
            }, sort: sortDesciptor)
        }
        
    }
    
    var body: some View {
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
    }
    
    func deleteItem(offsets: IndexSet) {
        for offset in offsets {
            let item = expenses[offset]
            modelContext.delete(item)
        }
    }
}

#Preview {
    ExpensesViewP1(sortBy: SortEnumP1.amount, filterEnum: FilterEnumP1.all)
}
