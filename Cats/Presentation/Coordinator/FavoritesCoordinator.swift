//
//  FavoritesCoordinator.swift
//  Cats
//
//  Created by Andres Carrillo on 4/11/20.
//

import UIKit

class FavoritesCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    
    init(navController: UINavigationController) {
        self.navigationController = navController
    }
    
    func start() {
        let vc = FavoritesViewController(AppDelegate.shared.diManager.getContainer().resolve(FavoritesViewModel.self)!)
        navigationController.pushViewController(vc, animated: true)
    }
    
}
