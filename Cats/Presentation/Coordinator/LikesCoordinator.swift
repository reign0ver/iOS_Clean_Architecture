//
//  LikesCoordinator.swift
//  Cats
//
//  Created by Andres Carrillo on 28/10/20.
//

import UIKit

class LikesCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    
    var navigationController: UINavigationController
    
    init(navController: UINavigationController) {
        self.navigationController = navController
    }
    
    func start() {
        let vc = LikesViewController(viewModel: AppDelegate.shared.diManager.getContainer().resolve(LikesViewModel.self)!)
        navigationController.pushViewController(vc, animated: true)
    }
    
}
