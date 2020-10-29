//
//  UIViewController + Extensions.swift
//  Cats
//
//  Created by Andres Carrillo on 27/10/20.
//


import UIKit

fileprivate var containerLoading: UIView?

//MARK: - Show loading indicator
extension UIViewController {
    func showLoading () {
        containerLoading = UIView(frame: view.bounds)
        containerLoading?.backgroundColor = .none
        
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.center = containerLoading!.center
        activityIndicator.startAnimating()
        containerLoading?.addSubview(activityIndicator)
        self.view.addSubview(containerLoading!)
    }
    
    func hideLoading () {
        containerLoading?.removeFromSuperview()
        containerLoading = nil
    }
}

//MARK: Add cornerRadius for whatever View
extension UIView {
    func setRadius(radius: CGFloat? = nil) {
        self.layer.cornerRadius = radius ?? self.frame.width / 5
        self.layer.masksToBounds = true
    }
}
