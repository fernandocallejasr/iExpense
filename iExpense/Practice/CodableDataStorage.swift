//
//  CodableDataStorage.swift
//  iExpense
//
//  Created by Fernando Callejas on 16/03/24.
//

import SwiftUI

struct CodableDataStorage: View {
    @State private var user = CodableUser(firstName: "Taylor", lastName: "Swift")
    
    var body: some View {
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            
            Button("Save User") {
                let encoder = JSONEncoder()
                
                if let data = try? encoder.encode(user) {
                    Foundation.UserDefaults.standard.set(data, forKey: "UserData")
                }
            }
            
        }
        
        
    }
}

struct CodableUser: Codable {
    let firstName: String
    let lastName: String
}

#Preview {
    CodableDataStorage()
}
