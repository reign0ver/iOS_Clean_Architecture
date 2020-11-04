//
//  FavoritesViewModel.swift
//  Cats
//
//  Created by Andres Carrillo on 3/11/20.
//

import Foundation

class FavoritesViewModel {
    
    var votes: [Vote] = []
    var navigationTitle = "Favorites"
    private let getAllVotesUseCase: GetVotesFromLocalDataSourceUseCase
    
    init(_ getAllVotesUseCase: GetVotesFromLocalDataSourceUseCase) {
        self.getAllVotesUseCase = getAllVotesUseCase
    }
    
    func getAllVotes() {
        votes = getAllVotesUseCase.execute()
    }
    
}
