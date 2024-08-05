//
//  ContentView.swift
//  iExpense
//
//  Created by Fernando Callejas on 15/03/24.
//

import SwiftUI

struct ContentView: View {
    @State private var expenses: Expenses = Expenses()
    @State private var isShowingNewExpenseView: Bool = false
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.cyan, .orange, .mint, .clear], startPoint: .bottomLeading, endPoint: .topTrailing)
                .ignoresSafeArea()
            
            VStack {
                List {
//                    ForEach(expenses.items, id: \.id) { expense in
                    ForEach(expenses.items) { expense in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(expense.name)
                                    .font(.headline.bold())
                                Text(expense.type)
                                    .font(.caption.italic())
                            }
                            
                            Spacer()
                            
                            Text(expense.amount, format: .currency(code: "USD"))
                        }
                    }
                    .onDelete { indexSet in
                        expenses.items.remove(atOffsets: indexSet)
                    }
                }
                .scrollContentBackground(.hidden)
                
                Button("Add Expense", systemImage: "plus") {
                    isShowingNewExpenseView.toggle()
                }
                .foregroundStyle(.primary)
                .fontWeight(.semibold)
                .padding(30)
                .background(.thinMaterial)
                .clipShape(.rect(cornerRadius: 35, style: .continuous))
                .padding(.bottom, 100)
                
            }
            .sheet(isPresented: $isShowingNewExpenseView) {
                AddView(expenses: expenses)
            }
            
        }
    }
    
}

#Preview {
    ContentView()
}
