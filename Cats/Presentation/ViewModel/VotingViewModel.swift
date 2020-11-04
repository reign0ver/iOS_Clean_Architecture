//
//  VotingViewModel.swift
//  Cats
//
//  Created by Andres Carrillo on 27/10/20.
//

import Foundation

protocol VotingViewModelDelegate: class {
    func updateView()
}

class VotingViewModel {
    
    var image: ImageBreed?
    let navigationTitle = "Voting"
    weak var delegate: VotingViewModelDelegate?
    
    private let getRandomImageUseCase: GetRandomCatImageUseCase
    private let saveLocalVoteUseCase: SaveVoteLocalUseCase
    
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
                print("Error at VotingViewModel -> ", error)
            }
        }
    }
    
    func saveVote(_ action: TypeOfVote) {
        guard let image = image else { return }
        let vote = Vote(name: image.id, imageURL: image.url, kind: action)
        let result = saveLocalVoteUseCase.execute(vote)
        //TODO
        if result {
            print("Greaaat Issi! :(")
        } else {
            print("Something went wrong.  We cannot save your vote u,u")
        }
    }
}
