//
//  DetailView.swift
//  RickAndMortyApi
//
//  Created by Berke Kesgin on 5.06.2024.
//

import SwiftUI
import Kingfisher

struct DetailView: View {
    
    var char: Character

    var body: some View {
        
        Form{
            
            Section(header: Text("Fotoğraf")){
                if let imageUrl = char.image {
                    KFImage(imageUrl)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                } else {
                    Text("Resim bulunamadı")
                }
            }
            
            Section(header: Text("Temel Bilgiler")) {
                Text("Adı: \(char.name ?? "Bilinmiyor")")
                Text("Durumu: \(char.status ?? "Bilinmiyor")")
                Text("Türü: \(char.species ?? "Bilinmiyor")")
                Text("Cinsiyeti: \(char.gender ?? "Bilinmiyor")")
            }
            
            Section(header: Text("Konum Bilgileri")) {
                Text("Bulunduğu Yer: \(char.location?.name ?? "Bilinmiyor")")
                Text("Kökeni: \(char.origin?.name ?? "Bilinmiyor")")
            }
            
            Section(header: Text("Bölüm Bilgileri")) {
                ForEach(char.episode ?? [], id: \.self) { episodeURL in
                    Text(episodeURL)
                }
            }

        } // Form içerisi
        .navigationBarTitle(char.name ?? "Bilinmeyen Karakter")
    }
}


#Preview {
    
    let exampleCharacter = Character(
        id: 1,
        name: "Rick Sanchez",
        status: "Alive",
        species: "Human",
        gender: "Male",
        origin: Character.Origin(name: "Earth (C-137)"),
        location: Character.Location(name: "Citadel of Ricks"),
        episode: [
            "https://rickandmortyapi.com/api/episode/1",
            "https://rickandmortyapi.com/api/episode/2",
            "https://rickandmortyapi.com/api/episode/3",
            // ve diğer bölümler...
        ],
        image: URL(string: "https://rickandmortyapi.com/api/character/avatar/1.jpeg")
    )

    return DetailView(char: exampleCharacter)

}
