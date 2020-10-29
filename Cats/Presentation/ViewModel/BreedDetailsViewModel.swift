//
//  BreedDetailsViewController.swift
//  Cats
//
//  Created by Andres Carrillo on 27/10/20.
//

import Foundation

protocol ImageViewModelDelegate: class {
    func updateImageURL()
}

class BreedDetailsViewModel {
    
    var imageURL: String = ""
    weak var delegate: ImageViewModelDelegate?
    
    private let useCase: GetBreedImageUseCase
    
    //MARK: Init
    init(_ useCase: GetBreedImageUseCase) {
        self.useCase = useCase
    }
    
    func getBreedImageURL(_ breedId: String) {
        useCase.execute(breedId) { [weak self] result in
            guard let strongSelf = self else { return }
            switch result {
            case .success(let imageBreed):
                strongSelf.imageURL = imageBreed[0].url
                strongSelf.delegate?.updateImageURL()
            case .failure(let error):
                print("Error at imageViewModel -> ", error)
            }
        }
    }
    
}
