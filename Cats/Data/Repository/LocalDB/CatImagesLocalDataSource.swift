//
//  CatImagesLocalService.swift
//  Cats
//
//  Created by Andres Carrillo on 26/10/20.
//

import Foundation

protocol CatImagesLocalDataSource {
    func save(vote: Vote) -> Bool
    func getAllVotes() -> [Vote]
}
