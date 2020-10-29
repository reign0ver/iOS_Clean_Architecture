//
//  MainCoordinator.swift
//  Cats
//
//  Created by Andres Carrillo on 28/10/20.
//

import UIKit

class MainCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navController: UINavigationController) {
        self.navigationController = navController
    }
    
    func start() {
        let vc = ListOfBreedsViewController(viewModel: AppDelegate.shared.diManager.getContainer().resolve(BreedsViewModel.self)!)
        navigationController.pushViewController(vc, animated: true)
    }
    
    func showBreedDetails(breed: Breed) {
        
    }
    
}
