//
//  RealmCatImagesDataSource.swift
//  Cats
//
//  Created by Andres Carrillo on 27/10/20.
//

import Foundation
import RealmSwift

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
    
    func getVotes() -> [Vote] {
        let votes = persistanceInstance.findAll()
        return mapRealmResultToAnArray(votes)
    }
    
    private func mapRealmResultToAnArray(_ result: Results<VoteEntity>) -> [Vote] {
        return result.map { voteEntity -> Vote in
            return Vote(
                name: voteEntity.name,
                date: voteEntity.date,
                imageURL: voteEntity.imageURL,
                vote: voteEntity.vote
            )
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
