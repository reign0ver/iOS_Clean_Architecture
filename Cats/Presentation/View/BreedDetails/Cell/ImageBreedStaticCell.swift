//
//  ImageBreedStaticCell.swift
//  Cats
//
//  Created by Andres Carrillo on 27/10/20.
//

import UIKit
import Kingfisher

class ImageBreedStaticCell: UITableViewCell {
    
    static let reuseIdentifier = String(describing: ImageBreedStaticCell.self)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: ImageBreedStaticCell.reuseIdentifier)
        setupImage()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let breedImage: UIImageView = {
        let image = UIImage(named: "goes_in")
        let imageView = UIImageView(image: image)
        return imageView
    }()
    
    private func setupImage() {
        addSubview(breedImage)
        breedImage.translatesAutoresizingMaskIntoConstraints = false
        let scale = UIScreen.main.scale
        let constraints = [
            breedImage.topAnchor.constraint(greaterThanOrEqualTo: topAnchor, constant: 8),
            breedImage.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: -8),
            breedImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            breedImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            breedImage.widthAnchor.constraint(lessThanOrEqualToConstant: 100 * scale),
            breedImage.heightAnchor.constraint(equalToConstant: 100 * scale),
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    func configure(_ url: String) {
        breedImage.setImageFromURL(url, estimatedWidth: 200, estimatedHeight: 200, cornerRadius: 100)
    }
}
