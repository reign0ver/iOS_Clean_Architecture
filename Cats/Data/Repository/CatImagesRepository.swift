//
//  CatImagesRepository.swift
//  Cats
//
//  Created by Andres Carrillo on 26/10/20.
//

import Foundation

class CatImagesRepository {
    
    private let localDataSource: CatImagesLocalDataSource
    private let remoteDataSource: CatImagesRemoteDataSource
    
    init(_ localDataSource: CatImagesLocalDataSource, _ remoteDataSource: CatImagesRemoteDataSource) {
        self.localDataSource = localDataSource
        self.remoteDataSource = remoteDataSource
    }
    
    func fetchBreedImage(_ breedId: String, completion: @escaping (Result<[ImageBreed], NetworkError>) -> Void) {
        remoteDataSource.getBreedImage(breedId, completion: completion)
    }
    
    func fetchRandomImages(completion: @escaping (Result<[ImageBreed], NetworkError>) -> Void) {
        remoteDataSource.getRandomImages(completion: completion)
    }
    
    func saveVote(_ vote: Vote) -> Bool {
        return localDataSource.save(vote: vote)
    }
    
}
