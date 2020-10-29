//
//  RealmCatImagesDataSource.swift
//  Cats
//
//  Created by Andres Carrillo on 27/10/20.
//

import Foundation

class RealmCatImagesDataSource: CatImagesLocalDataSource {
    
    private let persistanceInstance = BaseLocalDataSource<VoteEntity>()
    
    //TODO: Error handling, return a bool or throw the error til presentation layer(?)
    func save(vote: Vote) -> Bool {
        do {
            try persistanceInstance.insert(mapIntoVoteEntity(vote))
            return true
        } catch {
            print(error)
            return false
        }
    }
    
    private func mapIntoVoteEntity(_ vote: Vote) -> VoteEntity {
        let voteEntity = VoteEntity()
        voteEntity.name = vote.name
        voteEntity.imageURL = vote.imageURL
        voteEntity.vote = vote.vote
        return voteEntity
    }
    
}
