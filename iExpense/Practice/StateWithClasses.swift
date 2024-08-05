//
//  StateWithClasses.swift
//  iExpense
//
//  Created by Fernando Callejas on 15/03/24.
//

import SwiftUI
import Observation

struct StateWithClasses: View {
    @State private var user = User()
    
    var body: some View {
        List {
            VStack {
                Text("Your name is \(user.firstName) \(user.lastName)")
                
                TextField("First Name", text: $user.firstName)
                TextField("Last Name", text: $user.lastName)
            }
        }
    }
}

@Observable
class User {
    var firstName = "Rafael"
    var lastName = "Nadal"
}

#Preview {
    StateWithClasses()
}
