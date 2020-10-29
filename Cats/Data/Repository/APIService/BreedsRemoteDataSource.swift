//
//  BreedsService.swift
//  Cats
//
//  Created by Andres Carrillo on 26/10/20.
//

import Foundation

protocol BreedsRemoteDataSource {
    
    func getListOfBreeds(completion: @escaping (Result<[Breed], NetworkError>) -> Void)
    
}
