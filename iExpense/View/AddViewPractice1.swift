//
//  SwiftUIView.swift
//  iExpense
//
//  Created by Fernando Callejas on 03/07/24.
//

import SwiftData
import SwiftUI

struct AddViewPractice1: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    
    @State private var itemName = ""
    @State private var itemCategory = ExpenseCategory.Personal
    @State private var itemPrice = 0.0
    
    @State private var itemNameNavTitle = "Item Name"
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.cyan, .mint, .indigo], startPoint: .bottomLeading, endPoint: .topTrailing)
                .ignoresSafeArea()
            
            VStack {
                VStack {
                    Text("Item")
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(10)
                        .padding(.bottom, 40)
                    
                    TextField("Enter Item Name", text: $itemName)
                        .multilineTextAlignment(.center)
                    
                    Picker("Category", selection: $itemCategory) {
                        ForEach(ExpenseCategory.allCases, id: \.self) { category in
                            Text(category.rawValue)
                        }
                    }
                    .tint(.primary)
                    
                    TextField("Price", value: $itemPrice, format: .currency(code: "USD"))
                        .multilineTextAlignment(.center)
                        .keyboardType(.decimalPad)
                        .padding(.bottom)
                    
                }
                .padding()
                .background(.regularMaterial)
                .clipShape(.rect(cornerRadius: 25))
                .padding(.horizontal, 30)
                
                
                
                Button("Add Item") {
                    let item = ExpenseItemPractice1(name: itemName, price: itemPrice, category: itemCategory)
                    modelContext.insert(item)
                    dismiss()
                }
                .padding()
                .background(.thinMaterial)
                .clipShape(.rect(cornerRadius: 15))
                .foregroundStyle(.primary)
                .padding(.vertical, 50)
                .toolbarColorScheme(.dark, for: .navigationBar)
                .navigationTitle($itemNameNavTitle)
                .navigationBarTitleDisplayMode(.inline)
            }
            
        }
    }
}

#Preview {
    AddViewPractice1()
}
