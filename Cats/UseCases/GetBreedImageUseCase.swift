//
//  GetBreedImageUseCase.swift
//  Cats
//
//  Created by Andres Carrillo on 27/10/20.
//

import Foundation

class GetBreedImageUseCase {
    
    private let repository: CatImagesRepository
    
    init(_ repository: CatImagesRepository) {
        self.repository = repository
    }
    
    func execute(_ breedId: String, completion: @escaping (Result<[ImageBreed], NetworkError>) -> Void) {
        repository.fetchBreedImage(breedId, completion: completion)
    }
}
