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
    
    private var controllerIcons: [UIImage] {
        return [
            UIImage(named: "cat")!,
            UIImage(named: "voting")!
        ]
    }
    
    private var controllerIconsPressed: [UIImage] {
        return [
            UIImage(named: "cat_pressed")!,
            UIImage(named: "voting_pressed")!
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
            controllers[index].tabBarItem.image = controllerIcons[index].withRenderingMode(.alwaysOriginal)
            controllers[index].tabBarItem.selectedImage = controllerIconsPressed[index].withRenderingMode(.alwaysOriginal)
        }
    }

}
