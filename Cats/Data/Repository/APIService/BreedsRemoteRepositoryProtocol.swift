//
//  BreedsRemoteRepositoryProtocol.swift
//  TechnicalTestCondorLabs
//
//  Created by Andrés Carrillo on 5/09/20.
//  Copyright © 2020 Andrés Carrillo. All rights reserved.
//

import Foundation

protocol BreedsRemoteRepositoryProtocol {
    
    func getListOfBreeds(completion: @escaping (Result<[Breed], NetworkError>) -> Void)
    
}
