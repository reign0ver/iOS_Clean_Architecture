//
//  SaveVoteLocalUseCase.swift
//  Cats
//
//  Created by Andres Carrillo on 27/10/20.
//

import Foundation

class SaveVoteLocalUseCase {
    
    private let repository: CatImagesRepository
    
    init(_ repository: CatImagesRepository) {
        self.repository = repository
    }
    
    func execute(_ vote: Vote) -> Bool {
        return repository.saveVote(vote)
    }
}
