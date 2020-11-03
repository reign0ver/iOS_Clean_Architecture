//
//  MainCoordinator.swift
//  Cats
//
//  Created by Andres Carrillo on 28/10/20.
//

import UIKit

class MainCoordinator: NSObject, Coordinator {
    
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navController: UINavigationController) {
        self.navigationController = navController
    }
    
    func start() {
        let vc = ListOfBreedsViewController(viewModel: AppDelegate.shared.diManager.getContainer().resolve(BreedsViewModel.self)!)
        navigationController.delegate = self
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func showBreedDetails(breed: Breed) {
        let breedDetailsCoordinator = BreedDetailsCoordinator(breed: breed, navController: navigationController)
        breedDetailsCoordinator.parentCoordinator = self
        childCoordinators.append(breedDetailsCoordinator)
        breedDetailsCoordinator.start()
    }
    
    func showLikesWindow() {
        let likesCoordinator = LikesCoordinator(navController: navigationController)
        childCoordinators.append(likesCoordinator)
        likesCoordinator.start()
    }
    
}

extension MainCoordinator: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        guard let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from) else {
            return
        }
        
        // Check whether our view controller array already contains that view controller.
        // If it does it means we’re pushing a different view controller on top rather than popping it, so exit.
        if navigationController.viewControllers.contains(fromViewController) {
            return
        }
    }
}
