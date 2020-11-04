//
//  FavoritesCell.swift
//  Cats
//
//  Created by Andres Carrillo on 3/11/20.
//

import UIKit

class FavoritesCell: UITableViewCell {

    //MARK: Init
    
    static let reuseIdentifier = String(describing: FavoritesCell.self)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: FavoritesCell.reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupName() {
        addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        let constraints = [
            nameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            nameLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16),
            nameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: catImage.trailingAnchor, constant: 16),
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    private func setupCatImage() {
        addSubview(catImage)
        catImage.translatesAutoresizingMaskIntoConstraints = false
        let constraints = [
            catImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            catImage.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16),
            catImage.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            catImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    //MARK: Views
    
    private let catImage: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        return label
    }()
}
