//
//  DIManager.swift
//  Cats
//
//  Created by Andres Carrillo on 27/10/20.
//

import Foundation
import Swinject

final class DIManager {
    
    private let container: Container
    
    init() {
        self.container = Container()
        registerDependencies()
    }
    
    func getContainer() -> Container {
        return self.container
    }
    
    private func registerDependencies() {
        //Data Sources
        //TODO MOCKS
        #if MOCKS
        container.register(BreedsRemoteDataSource.self) { _ in
            BreedsService()
        }
        container.register(CatImagesRemoteDataSource.self) { _ in
            CatImagesService()
        }
        container.register(CatImagesLocalDataSource.self) { _ in
            RealmCatImagesDataSource()
        }
        #else
        container.register(BreedsRemoteDataSource.self) { _ in
            BreedsService()
        }
        
        container.register(CatImagesRemoteDataSource.self) { _ in
            CatImagesService()
        }
        container.register(CatImagesLocalDataSource.self) { _ in
            RealmCatImagesDataSource()
        }
        #endif
        
        //Repositories
        container.register(BreedsRepository.self) { r in
            BreedsRepository(r.resolve(BreedsRemoteDataSource.self)!)
        }
        container.register(CatImagesRepository.self) { r in
            CatImagesRepository(r.resolve(CatImagesLocalDataSource.self)!, r.resolve(CatImagesRemoteDataSource.self)!)
        }
        
        //UseCases
        container.register(GetListOfBreedsUseCase.self) { r in
            GetListOfBreedsUseCase(r.resolve(BreedsRepository.self)!)
        }
        container.register(GetBreedImageUseCase.self) { r in
            GetBreedImageUseCase(r.resolve(CatImagesRepository.self)!)
        }
        container.register(GetRandomCatImageUseCase.self) { r in
            GetRandomCatImageUseCase(r.resolve(CatImagesRepository.self)!)
        }
        container.register(SaveVoteLocalUseCase.self) { r in
            SaveVoteLocalUseCase(r.resolve(CatImagesRepository.self)!)
        }
        container.register(GetVotesFromLocalDataSourceUseCase.self) { r in
            GetVotesFromLocalDataSourceUseCase(r.resolve(CatImagesRepository.self)!)
        }
        
        //ViewModels
        container.register(BreedsViewModel.self) { r in
            BreedsViewModel(r.resolve(GetListOfBreedsUseCase.self)!)
        }
        container.register(BreedDetailsViewModel.self) { r in
            BreedDetailsViewModel(r.resolve(GetBreedImageUseCase.self)!)
        }
        container.register(VotingViewModel.self) { r in
            VotingViewModel(r.resolve(GetRandomCatImageUseCase.self)!, r.resolve(SaveVoteLocalUseCase.self)!)
        }
        container.register(FavoritesViewModel.self) { r in
            FavoritesViewModel(r.resolve(GetVotesFromLocalDataSourceUseCase.self)!)
        }
        
        //Views
        container.register(ListOfBreedsViewController.self) { r in
            ListOfBreedsViewController(viewModel: r.resolve(BreedsViewModel.self)!)
        }
    }
}
