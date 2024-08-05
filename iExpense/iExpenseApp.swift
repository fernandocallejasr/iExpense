//
//  iExpenseApp.swift
//  iExpense
//
//  Created by Fernando Callejas on 15/03/24.
//

import SwiftData
import SwiftUI

@main
struct iExpenseApp: App {
    var body: some Scene {
        WindowGroup {
//            ContentView()
//            UserDefaults()
//            CodableStorageUserDefaultsPractice()
            Practice1()
        }
        .modelContainer(for: ExpensesPractice1.self)
    }
}
