//
//  AppCoordinator.swift
//  Cats
//
//  Created by Andres Carrillo on 4/11/20.
//

import UIKit

class AppCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    private let window: UIWindow
    private let tabBarCoordinator: TabBarCoordinator
    
    init(window: UIWindow) {
        self.navigationController = UINavigationController()
        self.window = window
        self.tabBarCoordinator = TabBarCoordinator(navigationController: navigationController)
    }
    
    func start() {
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        coordinateToTabBar()
    }
    
    private func coordinateToTabBar() {
        coordinate(to: tabBarCoordinator)
    }
}
