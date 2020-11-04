//
//  TabBarCoordinator.swift
//  Cats
//
//  Created by Andres Carrillo on 4/11/20.
//

import UIKit

class TabBarCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    private let tabBarController = UITabBarController()
    
    //TatBar Coordinator Items
    private let breedsCoordinator = BreedsCoordinator(navController: UINavigationController())
    private let votingCoordinator = VotingCoordinator(navController: UINavigationController())
    private let favoritesCoordinator = FavoritesCoordinator(navController: UINavigationController())
    
    private var controllers: [UIViewController] {
        return [
            breedsCoordinator.navigationController,
            votingCoordinator.navigationController,
            favoritesCoordinator.navigationController
        ]
    }
    
    private var controllerIcons: [UIImage] {
        return [
            UIImage(named: "cat")!,
            UIImage(named: "voting")!,
            UIImage(named: "favorite")!
        ]
    }
    
    private var controllerIconsPressed: [UIImage] {
        return [
            UIImage(named: "cat_pressed")!,
            UIImage(named: "voting_pressed")!,
            UIImage(named: "favorite_pressed")!
        ]
    }
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        tabBarController.viewControllers = controllers
        tabBarController.modalPresentationStyle = .fullScreen
        setTabBarIcons()
        startCoordinators()
        navigationController.present(tabBarController, animated: true)
    }
    
    private func startCoordinators() {
        coordinate(to: breedsCoordinator)
        coordinate(to: votingCoordinator)
        coordinate(to: favoritesCoordinator)
    }
    
    private func setTabBarIcons() {
        for index in 0...controllers.count - 1 {
            controllers[index].tabBarItem.image = controllerIcons[index].withRenderingMode(.alwaysOriginal)
            controllers[index].tabBarItem.selectedImage = controllerIconsPressed[index].withRenderingMode(.alwaysOriginal)
        }
    }
}
