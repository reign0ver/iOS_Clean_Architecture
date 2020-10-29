//
//  StaticItalicTextCell.swift
//  Cats
//
//  Created by Andres Carrillo on 27/10/20.
//

import UIKit

class StaticItalicTextCell: UITableViewCell {
    
    static let reuseIdentifier = String(describing: StaticItalicTextCell.self)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: BreedsCell.reuseIdentifier)
        setupBreedName()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .italicSystemFont(ofSize: 14)
        label.textColor = .darkGray
        label.numberOfLines = 0
        
        return label
    }()
    
    private func setupBreedName() {
        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        let constraints = [
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8),
            titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    func configure(_ text: String) {
        titleLabel.text = text
    }
}
