//
//  Coordinator.swift
//  Cats
//
//  Created by Andres Carrillo on 28/10/20.
//

import UIKit

protocol Coordinator: class {
    var navigationController: UINavigationController { get set }
    
    func start()
    func coordinate(to coordinator: Coordinator)
}

extension Coordinator {
    func coordinate(to coordinator: Coordinator) {
        coordinator.start()
    }
}
