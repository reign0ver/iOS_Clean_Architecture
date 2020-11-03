//
//  BreedsService.swift
//  Cats
//
//  Created by Andres Carrillo on 27/10/20.
//

import Foundation

final class BreedsService: BaseRemoteDataSource, BreedsRemoteDataSource {
    
    func getListOfBreeds(completion: @escaping (Result<[Breed], NetworkError>) -> Void) {
        let endpoint = NetworkConstants.fetchListOfBreeds
        sendRequest(endpoint, of: [Breed].self) { result in
            switch result {
            case .success(let breeds):
                completion(.success(breeds))
                break
            case.failure(let error):
                completion(.failure(error))
                break
            }
        }
    }
}
