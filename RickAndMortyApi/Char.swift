//
//  Char.swift
//  RickAndMortyApi
//
//  Created by Berke Kesgin on 4.06.2024.
//

import Foundation

struct Character: Codable, Identifiable {
    
    var id: Int?
    var name: String?
    var status: String?
    var species: String?
    var gender: String?
    var origin: Origin?
    var location: Location?
    var episode: [String]?
    
    var image: URL?
    
    struct Origin: Codable {
        var name: String
    }
    
    struct Location: Codable {
        var name: String
    }
    
    enum CodingKeys: String, CodingKey {
            case id
            case name
            case status
            case species
            case gender
            case origin = "origin"
            case location = "location"
            case episode = "episode"
            case image = "image"
    }
    
}
