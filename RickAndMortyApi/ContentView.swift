//
//  ContentView.swift
//  RickAndMortyApi
//
//  Created by Berke Kesgin on 4.06.2024.
//

import SwiftUI
import Kingfisher

struct CharView: View {
    
    @ObservedObject var charViewModel = CharViewModel()
    
    var body: some View {
        NavigationView{

            VStack {
                Button(action: {
                    charViewModel.getRandomCharUrlAndFetchChars()
                }, label: {
                    Text("Rick And Morty Api")
                    .font(.largeTitle)
                })
            
                // liste görünümü
                List {
                    ForEach(charViewModel.chars) { char in
                        NavigationLink(destination: DetailView(char: char)) {
                            // bu HStack bir karakteri temsil eden hücredir!
                            HStack {
                                if let imageUrl = char.image {
                                    KFImage(imageUrl)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 100, height: 100)
                                        .cornerRadius(50)
                                        .padding(.trailing, 10)
                                }
                                VStack(alignment: .leading) {
                                    if let charName = char.name,
                                       let charStatus = char.status,
                                       let charGener = char.gender{
                                        Text(charName)
                                            .font(.headline)
                                        HStack {
                                            Circle()
                                                .fill(charStatusColor(status: charStatus))
                                                .frame(width: 10, height: 10)
                                            Text(charStatus)
                                                .font(.subheadline)
                                                .foregroundColor(.gray)
                                            Text(" - ")
                                            Text(charGener)
                                                .font(.subheadline)
                                                .foregroundColor(.gray)

                                        }
                                    }
                                    else{
                                        // nil geliyor. dikkat!
                                    }
                                }
                            }
                            .padding(.vertical, 5)

                        }
                    }
                }.listStyle(.insetGrouped)
            }
            
            
            Spacer()
        }
    }
    
    func charStatusColor(status: String) -> Color {
        switch status {
        case "Alive":
            return .green
        case "Dead":
            return .red
        default:
            return .gray
        }
    }

}

#Preview {
    CharView()
}
