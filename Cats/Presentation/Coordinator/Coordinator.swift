//
//  Coordinator.swift
//  Cats
//
//  Created by Andres Carrillo on 28/10/20.
//

import UIKit

protocol Coordinator: class {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
}
