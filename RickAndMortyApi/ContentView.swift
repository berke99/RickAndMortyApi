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
        VStack {
            Button(action: {
                //charViewModel.getChars()
            }, label: {
                Text("Rick And Morty Api")
                    .font(.largeTitle)
            })
            
            NavigationView{
                List {
                    ForEach(charViewModel.chars) { char in
                        NavigationLink(destination: DetailView(char: char)) {
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
                                    Text(char.name!)
                                        .font(.headline)
                                    Text(char.status!)
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
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
}

#Preview {
    CharView()
}
