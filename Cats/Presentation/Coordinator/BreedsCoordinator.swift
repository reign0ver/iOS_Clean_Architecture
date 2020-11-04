//
//  BreedsCoordinator.swift
//  Cats
//
//  Created by Andres Carrillo on 28/10/20.
//

import UIKit

class BreedsCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    
    init(navController: UINavigationController) {
        self.navigationController = navController
    }
    
    func start() {
        let vc = ListOfBreedsViewController(viewModel: AppDelegate.shared.diManager.getContainer().resolve(BreedsViewModel.self)!)
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func showBreedDetails(breed: Breed) {
        let breedDetailsCoordinator = BreedDetailsCoordinator(breed: breed, navController: navigationController)
        coordinate(to: breedDetailsCoordinator)
    }
}
