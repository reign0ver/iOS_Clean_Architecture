//
//  CatImagesLocalMock.swift
//  Cats
//
//  Created by Andres Carrillo on 4/11/20.
//

import Foundation

final class CatImagesLocalMock: CatImagesLocalDataSource {
    
    private let votes: [Vote] = [
        Vote(name: "Fav1", date: Date(), imageURL: "https://cats.com", kind: .like),
        Vote(name: "Fav2", date: Date(), imageURL: "https://cats.net", kind: .dislike),
        Vote(name: "Fav3", date: Date(), imageURL: "https://cats.co", kind: .like),
        Vote(name: "Fav4", date: Date(), imageURL: "https://cats.gov", kind: .dislike),
        Vote(name: "Fav5", date: Date(), imageURL: "https://cats.io", kind: .like),
        Vote(name: "Fav6", date: Date(), imageURL: "https://cats.org", kind: .like)
    ]
    
    func save(vote: Vote) -> Bool {
        if vote.name.isEmpty || vote.imageURL.isEmpty  {
            return false
        }
        return true
    }
    
    func getAllVotes() -> [Vote] {
        return votes
    }
}
