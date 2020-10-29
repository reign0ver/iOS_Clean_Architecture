//
//  BreedDetailsCoordinator.swift
//  Cats
//
//  Created by Andres Carrillo on 28/10/20.
//

import UIKit

class BreedDetailsCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    private let breed: Breed
    
    init(breed: Breed, navController: UINavigationController) {
        self.navigationController = navController
        self.breed = breed
    }
    
    func start() {
        let vc = BreedDetailsViewController(breed, AppDelegate.shared.diManager.getContainer().resolve(BreedDetailsViewModel.self)!)
        navigationController.pushViewController(vc, animated: true)
    }
    
}
