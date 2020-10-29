//
//  CatImagesService.swift
//  Cats
//
//  Created by Andres Carrillo on 26/10/20.
//

import Foundation

protocol CatImagesRemoteDataSource {
    
    func getBreedImage(_ breedId: String, completion: @escaping (Result<[ImageBreed], NetworkError>) -> Void)
    
    func getRandomImages(completion: @escaping (Result<[ImageBreed], NetworkError>) -> Void)
}
