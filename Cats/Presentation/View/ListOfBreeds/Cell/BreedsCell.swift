//
//  BreedsCell.swift
//  Cats
//
//  Created by Andres Carrillo on 27/10/20.
//

import UIKit

class BreedsCell: UITableViewCell {
    
    static let reuseIdentifier = String(describing: BreedsCell.self)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: BreedsCell.reuseIdentifier)
        setupBreedName()
        setupArrowIcon()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    private let arrowIcon: UIImageView = {
        let image = UIImage(named: "goes_in")
        let imageView = UIImageView(image: image)
        
        return imageView
    }()
    
    private func setupBreedName() {
        addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        let constraints = [
            nameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            nameLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16),
            nameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    private func setupArrowIcon() {
        addSubview(arrowIcon)
        arrowIcon.translatesAutoresizingMaskIntoConstraints = false
        let constraints = [
            arrowIcon.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            arrowIcon.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 16),
            arrowIcon.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            arrowIcon.widthAnchor.constraint(equalToConstant: 12),
            arrowIcon.heightAnchor.constraint(equalToConstant: 12),
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    func configure(_ breed: Breed) {
        nameLabel.text = breed.name
    }
}
