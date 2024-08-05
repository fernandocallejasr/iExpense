//
//  UserDefaults.swift
//  iExpense
//
//  Created by Fernando Callejas on 16/03/24.
//

import SwiftUI

struct UserDefaults: View {
//    @State private var tapCount: Int = Foundation.UserDefaults.standard.integer(forKey: "Tap")
    @AppStorage("tapCounter") private var tapCount: Int = 0
    @AppStorage("userLightPreference") private var lightPreference: Bool = true
    
    var body: some View {
        Button("Tap Counts: \(tapCount)") {
            tapCount += 1
//            Foundation.UserDefaults.standard.set(tapCount, forKey: "Tap")
        }
        .padding(30)
        
        
        
        Button("\(lightPreference ? "Dark" : "Light") mode") {
            lightPreference.toggle()
//            Foundation.UserDefaults.standard.set(lightPreference, forKey: "userLightPreference")
        }
    }
}

#Preview {
    UserDefaults()
}
