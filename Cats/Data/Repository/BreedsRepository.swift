//
//  BreedsRepository.swift
//  Cats
//
//  Created by Andres Carrillo on 26/10/20.
//

import Foundation

class BreedsRepository {
    
    private let remoteDataSource: BreedsRemoteDataSource
    
    init(_ remoteRepository: BreedsRemoteDataSource) {
        self.remoteDataSource = remoteRepository
    }
    
    func fetchBreeds(completion: @escaping (Result<[Breed], NetworkError>) -> Void) {
        remoteDataSource.getListOfBreeds(completion: completion)
    }
}
