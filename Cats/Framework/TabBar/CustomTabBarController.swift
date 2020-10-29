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
    private let likesCoordinador = LikesCoordinator(navController: UINavigationController())
    
    private var controllers: [UIViewController] {
        return [
            mainCoordinator.navigationController,
            likesCoordinador.navigationController
        ]
    }
    
    private var controllerNames: [String] {
        return [
            "Breeds",
            "Likes"
        ]
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        startCoordinators()
        viewControllers = controllers
        setTabBarTitles()
    }
    
    private func startCoordinators() {
        mainCoordinator.start()
        likesCoordinador.start()
    }
    
    private func setTabBarTitles() {
        for index in 0...controllers.count - 1 {
            controllers[index].tabBarItem.title = controllerNames[index]
        }
    }

}
