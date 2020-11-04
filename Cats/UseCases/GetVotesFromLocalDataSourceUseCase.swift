//
//  GetVotesFromLocalDataSourceUseCase.swift
//  Cats
//
//  Created by Andres Carrillo on 3/11/20.
//

import Foundation

class GetVotesFromLocalDataSourceUseCase {
    
    private let repository: CatImagesRepository
    
    init(_ repository: CatImagesRepository) {
        self.repository = repository
    }
    
    func execute() -> [Vote] {
        return repository.getAllVotes()
    }
    
}
