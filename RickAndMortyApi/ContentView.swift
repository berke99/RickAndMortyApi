//
//  ContentView.swift
//  RickAndMortyApi
//
//  Created by Berke Kesgin on 4.06.2024.
//

import SwiftUI

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
                            HStack{
                                // kingfisher
                            }
                            VStack {
                                Text(char.name!)
                                Text(char.status!)
                            }
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
