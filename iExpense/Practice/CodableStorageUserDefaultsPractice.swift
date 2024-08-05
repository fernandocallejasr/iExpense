//
//  CodableStorageUserDefaultsPractice.swift
//  iExpense
//
//  Created by Fernando Callejas on 19/03/24.
//

import SwiftUI

struct Artist: Codable {
    let name: String
}

struct CodableStorageUserDefaultsPractice: View {
    @State private var currentArtist: String = ""
    @State private var artistArray: [Artist] = []
    
    var body: some View {
        VStack {
            HStack {
                Text("Artist Name: ")
                TextField("Artist Name", text: $currentArtist)
                    .padding(.leading, 20)
            }
            .padding(30)
            
            Button("Add Artist") {
                addArtistToLibrary(artist: Artist(name: currentArtist))
                currentArtist = ""
            }
            
            List {
                ForEach(artistArray, id: \.name) { artist in
                    Text(artist.name)
                        .font(.title)
                        .fontWeight(.bold)
                }
            }
        }
        .onAppear {
            self.artistArray = fetchArtists()
        }
    }
    
    func addArtistToLibrary(artist: Artist) {
        artistArray.append(artist)
        
        let encoder = JSONEncoder()
        
        if let encodedArray = try? encoder.encode(artistArray) {
            Foundation.UserDefaults.standard.set(encodedArray, forKey: "artists")
        }
    }
    
    func fetchArtists() -> [Artist] {
        let decoder = JSONDecoder()
        guard let jsonArtists = Foundation.UserDefaults.standard.data(forKey: "artists") else {
            return []
        }
        
        if let decodedArray = try? decoder.decode([Artist].self, from: jsonArtists ) {
            return decodedArray
        }
        
        return []
    }
}

#Preview {
    CodableStorageUserDefaultsPractice()
}
