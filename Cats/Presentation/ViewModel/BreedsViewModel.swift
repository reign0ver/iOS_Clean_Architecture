//
//  BreedsViewModel.swift
//  Cats
//
//  Created by Andres Carrillo on 27/10/20.
//

import Foundation

protocol BreedsViewModelDelegate: class {
    func reloadData()
}

class BreedsViewModel {
    
    var breeds: [Breed] = []
    weak var delegate: BreedsViewModelDelegate?
    
    private let useCase: GetListOfBreedsUseCase
    
    //MARK: View Messages
    let navigationTitle = "Cat Breeds"
    
    //MARK: Init
    init(_ useCase: GetListOfBreedsUseCase) {
        self.useCase = useCase
    }
    
    func getListOfBreeds() {
        useCase.execute { [weak self] result in
            guard let strongSelf = self else { return }
            switch result {
            case .success(let breeds):
                strongSelf.breeds = breeds
                strongSelf.delegate?.reloadData()
                break
            case .failure(let error):
                print("Error at BreedsViewModel", error)
                break
            }
        }
    }
    
}
