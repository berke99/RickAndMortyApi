//
//  CharViewModel.swift
//  RickAndMortyApi
//
//  Created by Berke Kesgin on 4.06.2024.
//

import Foundation
import Alamofire

class CharViewModel: ObservableObject {
    
    @Published var chars: [Character] = []
    
    private let url: String = "https://rickandmortyapi.com/api/character/1,2,3,4,5,6"

    init() {
        getChars()
    }
    
    func getChars(){
        
        AF.request(url,method: .get).responseDecodable(of: [Character].self) { response in
            switch response.result {
            case .success(let data):
                self.chars = data
            case.failure(let err):
                print(err)
            }
        }
        
    }
    
    
}
