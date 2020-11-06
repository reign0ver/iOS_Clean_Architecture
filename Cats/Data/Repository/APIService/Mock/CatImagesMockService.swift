//
//  CatImagesMockService.swift
//  Cats
//
//  Created by Andres Carrillo on 4/11/20.
//

import Foundation

final class CatImagesMockService: CatImagesRemoteDataSource {
    
    private let imageBreed: [ImageBreed] = [
        ImageBreed(id: "xx123xx", url: "https://www.google.com/gatos_meow")
    ]
    
    func getBreedImage(_ breedId: String, completion: @escaping (Result<[ImageBreed], NetworkError>) -> Void) {
        if breedId == "validBreedId" {
            completion(.success(imageBreed))
        } else {
            completion(.failure(.genericError))
        }
    }
    
    func getRandomImages(completion: @escaping (Result<[ImageBreed], NetworkError>) -> Void) {
        completion(.success(imageBreed))
    }
    
}
