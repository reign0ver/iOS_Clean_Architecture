//
//  CustomTabBarController.swift
//  Cats
//
//  Created by Andres Carrillo on 27/10/20.
//

import UIKit

//TODO
class CustomTabBarController: UITabBarController {
    
    private let mainCoordinator = MainCoordinator(navController: UINavigationController())
    private let votingCoordinator = VotingCoordinator(navController: UINavigationController())
    private let favoritesCoordinator = FavoritesCoordinator(navController: UINavigationController())
    
    private var controllers: [UIViewController] {
        return [
            mainCoordinator.navigationController,
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

    override func viewDidLoad() {
        super.viewDidLoad()
        startCoordinators()
        viewControllers = controllers
        setTabBarIcons()
    }
    
    private func startCoordinators() {
        mainCoordinator.start()
        votingCoordinator.start()
        favoritesCoordinator.start()
    }
    
    private func setTabBarIcons() {
        for index in 0...controllers.count - 1 {
            controllers[index].tabBarItem.image = controllerIcons[index].withRenderingMode(.alwaysOriginal)
            controllers[index].tabBarItem.selectedImage = controllerIconsPressed[index].withRenderingMode(.alwaysOriginal)
        }
    }

}
