//
//  LikesViewModel.swift
//  Cats
//
//  Created by Andres Carrillo on 27/10/20.
//

import Foundation

protocol LikesViewModelDelegate: class {
    func updateView()
}

class LikesViewModel {
    
    var image: ImageBreed?
    weak var delegate: LikesViewModelDelegate?
    
    private let getRandomImageUseCase: GetRandomCatImageUseCase
    private let saveLocalVoteUseCase: SaveVoteLocalUseCase
    
    let navigationTitle = "Votes"
    
    
    //MARK: Init
    init(_ getRandomImageUseCase: GetRandomCatImageUseCase, _ saveLocalVoteUseCase: SaveVoteLocalUseCase) {
        self.getRandomImageUseCase = getRandomImageUseCase
        self.saveLocalVoteUseCase = saveLocalVoteUseCase
    }
    
    func getRandomImages() {
        getRandomImageUseCase.execute { [weak self] result in
            guard let strongSelf = self else { return }
            switch result {
            case .success(let images):
                strongSelf.image = images[0]
                strongSelf.delegate?.updateView()
                break
            case .failure(let error):
                print("Error at LikesViewModel -> ", error)
            }
        }
    }
    
    func saveVote(_ action: TypeOfVote) {
        guard let image = image else { return }
        let vote = Vote(name: image.id, imageURL: image.url, vote: action.rawValue)
        let result = saveLocalVoteUseCase.execute(vote)
        //TODO
        if result {
            print("Greaaat Issi! :(")
        } else {
            print("Something went wrong.  We cannot save your vote u,u")
        }
    }
}
