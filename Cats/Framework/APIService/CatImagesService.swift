//
//  CatImagesService.swift
//  Cats
//
//  Created by Andres Carrillo on 27/10/20.
//

import Foundation

final class CatImagesService: BaseRemoteDataSource, CatImagesRemoteDataSource {
    
    func getBreedImage(_ breedId: String, completion: @escaping (Result<[ImageBreed], NetworkError>) -> Void) {
        let endpoint = NetworkConstants.fetchImageByBreed + breedId
        sendRequest(endpoint, of: [ImageBreed].self) { result in
            switch result {
            case .success(let imageURL):
                completion(.success(imageURL))
                break
            case.failure(let error):
                completion(.failure(error))
                break
            }
        }
    }
    
    func getRandomImages(completion: @escaping (Result<[ImageBreed], NetworkError>) -> Void) {
        let endpoint = NetworkConstants.fetchRandomImages
        sendRequest(endpoint, of: [ImageBreed].self) { result in
            switch result {
            case .success(let imageURL):
                completion(.success(imageURL))
                break
            case.failure(let error):
                completion(.failure(error))
                break
            }
        }
    }
}
