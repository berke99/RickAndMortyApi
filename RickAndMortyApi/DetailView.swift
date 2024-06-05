//
//  DetailView.swift
//  RickAndMortyApi
//
//  Created by Berke Kesgin on 5.06.2024.
//

import SwiftUI

struct DetailView: View {
    
    var char: Character

    var body: some View {
        VStack {
            Text(char.name!)
                .font(.largeTitle)
            Text(char.status!)
            // Diğer karakter bilgilerini burada göster
            Spacer()
        }
        .padding()
    }
}


#Preview {
    let exampleCharacter = Character(id: 1, name: "rick", status: "alive", gender: "male")
    
    return DetailView(char: exampleCharacter)

}
