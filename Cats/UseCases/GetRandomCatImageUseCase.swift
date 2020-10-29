//
//  GetRandomCatImageUseCase.swift
//  Cats
//
//  Created by Andres Carrillo on 27/10/20.
//

import Foundation

class GetRandomCatImageUseCase {
    
    private let repository: CatImagesRepository
    
    init(_ repository: CatImagesRepository) {
        self.repository = repository
    }
    
    func execute(completion: @escaping (Result<[ImageBreed], NetworkError>) -> Void) {
        repository.fetchRandomImages(completion: completion)
    }
}
