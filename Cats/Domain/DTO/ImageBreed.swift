//
//  ImageBreed.swift
//  Cats
//
//  Created by Andres Carrillo on 26/10/20.
//

import Foundation

struct ImageBreed: Decodable {
    
    var id: String
    var url: String
    
    private enum CodingKeys: CodingKey {
        case id
        case url
    }
    
    init(id: String, url: String) {
        self.id = id
        self.url = url
    }
    
    init(from decoder: Decoder) throws {
        let container   = try decoder.container(keyedBy: CodingKeys.self)
        self.id         = try container.decode(String.self, forKey: .id)
        self.url        = try container.decode(String.self, forKey: .url)
    }
    
}
