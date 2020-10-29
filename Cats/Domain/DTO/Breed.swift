//
//  Breed.swift
//  Cats
//
//  Created by Andres Carrillo on 26/10/20.
//

import Foundation

struct Breed: Decodable {
    
    var alternativeNames: String?
    var id: String
    var name: String
    var description: String
    var origin: String
    var temperament: String
    var wikipediaURL: String?
    
    private enum CodingKeys: CodingKey {
        case alt_names
        case id
        case name
        case description
        case origin
        case temperament
        case wikipedia_url
    }
    
    init(arlternativeName: String,
         id: String, name: String,
         description: String,
         origin: String,
         temperament: String,
         wikipediaURL: String) {
        self.id = id
        self.name = name
        self.description = description
        self.origin = origin
        self.temperament = temperament
        self.wikipediaURL = wikipediaURL
    }
    
    init(from decoder: Decoder) throws {
        let container           = try decoder.container(keyedBy: CodingKeys.self)
        self.alternativeNames   = try container.decodeIfPresent(String.self, forKey: .alt_names)
        self.id                 = try container.decode(String.self, forKey: .id)
        self.name               = try container.decode(String.self, forKey: .name)
        self.description        = try container.decode(String.self, forKey: .description)
        self.origin             = try container.decode(String.self, forKey: .origin)
        self.temperament        = try container.decode(String.self, forKey: .temperament)
        self.wikipediaURL       = try container.decodeIfPresent(String.self, forKey: .wikipedia_url)
    }
}
