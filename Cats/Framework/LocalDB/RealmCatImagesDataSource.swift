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
            try persistanceInstance.insert(mapToVoteEntity(vote))
            return true
        } catch {
            print(error)
            return false
        }
    }
    
    func getAllVotes() -> [Vote] {
        let votes = persistanceInstance.findAll()
        return mapRealmResultToAnArray(votes)
    }
    
    private func mapRealmResultToAnArray(_ result: Results<VoteEntity>) -> [Vote] {
        return result.map { voteEntity -> Vote in
            return Vote(
                name: voteEntity.name,
                date: voteEntity.date,
                imageURL: voteEntity.imageURL,
                kind: TypeOfVote(rawValue: voteEntity.vote) ?? .like
            )
        }
    }
    
    private func mapToVoteEntity(_ vote: Vote) -> VoteEntity {
        return VoteEntity(
            name: vote.name,
            imageURL: vote.imageURL,
            vote: vote.kind.rawValue
        )
    }
    
}
