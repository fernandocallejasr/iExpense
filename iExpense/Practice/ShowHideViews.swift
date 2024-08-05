//
//  ShowHideViews.swift
//  iExpense
//
//  Created by Fernando Callejas on 15/03/24.
//

import SwiftUI

struct ShowHideViews: View {
    @State private var showingSheet: Bool = false
    
    var body: some View {
        Button("Show Sheet") {
            showingSheet.toggle()
        }
        .sheet(isPresented: $showingSheet) {
            SecondView(name: "Fernando")
        }
    }
}

struct SecondView: View {
    @Environment(\.dismiss) var dismiss
    let name: String
    
    var body: some View {
        Button("Dismiss") {
            dismiss()
        }
    }
}

#Preview {
    ShowHideViews()
}
