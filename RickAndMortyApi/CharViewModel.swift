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
    
    private var url: String = ""
    private let randomUniqNumberArray:[Int] = []
    
    init() {
        getRandomCharUrlAndFetchChars()
    }
    
    /// MainView İçerisindeki Fonksiyonu Hazırlar
    func getRandomCharUrlAndFetchChars(){
        getRandomCharUrl()
        getChars()
    }

    /// Rastgele 6 Char Getirilmiş bir Url Hazırlar
    private func getRandomCharUrl(){
        var randomNumbers = [Int]()
        
        while randomNumbers.count < 6 {
            let randomNumber = Int.random(in: 1...826)
            randomNumbers.append(randomNumber)
        }
            
        let baseUrl = "https://rickandmortyapi.com/api/character/"
        let randomNumbersString = randomNumbers.map { String($0) }.joined(separator: ",")
            
        url = baseUrl + randomNumbersString
        print(url)
    }

    /// Karakterleri Getiren Api İsteği
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
