//
//  DeleteItems_onDelete.swift
//  iExpense
//
//  Created by Fernando Callejas on 15/03/24.
//

import SwiftUI

struct DeleteItems_onDelete: View {
    @State private var numbers: [Int] = [13, 3, 33, 1989]
    @State private var currentNumber: Int = 1
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(numbers, id: \.self) { num in
                        Text("\(num)")
                    }
//                    .onDelete(perform: removeRows)
                    .onDelete { indexSet in
                        numbers.remove(atOffsets: indexSet)
                    }
                }
                
                Button("Add Number") {
                    numbers.append(currentNumber)
                    currentNumber += 1
                }
            }
            .toolbar {
                EditButton()
            }
        }
        
    }
    
    func removeRows(at offsets: IndexSet) {
        numbers.remove(atOffsets: offsets)
    }
}

#Preview {
    DeleteItems_onDelete()
}
