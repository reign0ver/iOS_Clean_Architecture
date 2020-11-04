//
//  GetListOfBreedsUseCase.swift
//  Cats
//
//  Created by Andres Carrillo on 27/10/20.
//

import Foundation

class GetListOfBreedsUseCase {
    
    private let repository: BreedsRepository
    
    init(_ repository: BreedsRepository) {
        self.repository = repository
    }
    
    func execute(completion: @escaping (Result<[Breed], NetworkError>) -> Void) {
        repository.fetchBreeds(completion: completion)
    }
    
}
