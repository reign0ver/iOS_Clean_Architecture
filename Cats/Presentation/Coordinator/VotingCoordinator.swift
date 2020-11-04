//
//  LikesCoordinator.swift
//  Cats
//
//  Created by Andres Carrillo on 28/10/20.
//

import UIKit

class VotingCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    
    init(navController: UINavigationController) {
        self.navigationController = navController
    }
    
    func start() {
        let vc = VotingViewController(viewModel: AppDelegate.shared.diManager.getContainer().resolve(VotingViewModel.self)!)
        navigationController.pushViewController(vc, animated: true)
    }
    
}
