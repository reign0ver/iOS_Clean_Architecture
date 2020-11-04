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
        setupCatImage()
        setupNameLabel()
        setupDateLabel()
        setupVoteImage()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Setting up the view
    
    func configure(vote: Vote) {
        nameLabel.text = vote.name
        setVoteImage(vote)
        catImage.setImageFromURL(vote.imageURL, estimatedWidth: 50, estimatedHeight: 50, cornerRadius: 20)
    }
    
    private func setVoteImage(_ vote: Vote) {
        switch vote.kind {
        case .like:
            voteImage.image = UIImage(named: "full_heart")
        case .dislike:
            voteImage.image = UIImage(named: "dislike")
        }
    }
    
    private func setupCatImage() {
        addSubview(catImage)
        catImage.translatesAutoresizingMaskIntoConstraints = false
        let constraints = [
            catImage.topAnchor.constraint(greaterThanOrEqualTo: self.topAnchor, constant: 16),
            catImage.bottomAnchor.constraint(lessThanOrEqualTo: self.bottomAnchor, constant: -16),
            catImage.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            catImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            catImage.widthAnchor.constraint(equalToConstant: 50),
            catImage.heightAnchor.constraint(equalToConstant: 50)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    private func setupNameLabel() {
        addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        let constraints = [
            nameLabel.topAnchor.constraint(greaterThanOrEqualTo: self.topAnchor, constant: 16),
            nameLabel.leadingAnchor.constraint(equalTo: catImage.trailingAnchor, constant: 16),
            nameLabel.heightAnchor.constraint(equalToConstant: 20)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    private func setupDateLabel() {
        addSubview(dateLabel)
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        let constraints = [
            dateLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            dateLabel.bottomAnchor.constraint(lessThanOrEqualTo: self.bottomAnchor, constant: -16),
            dateLabel.leadingAnchor.constraint(equalTo: catImage.trailingAnchor, constant: 16),
            dateLabel.heightAnchor.constraint(equalToConstant: 18)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    private func setupVoteImage() {
        addSubview(voteImage)
        voteImage.translatesAutoresizingMaskIntoConstraints = false
        let constraints = [
            voteImage.topAnchor.constraint(greaterThanOrEqualTo: self.topAnchor, constant: 16),
            voteImage.bottomAnchor.constraint(lessThanOrEqualTo: self.bottomAnchor, constant: -16),
            voteImage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            voteImage.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            voteImage.widthAnchor.constraint(equalToConstant: 25),
            voteImage.heightAnchor.constraint(equalToConstant: 25)
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
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.font = .italicSystemFont(ofSize: 12)
        label.text = "8 Oct 2020, 20:58"
        return label
    }()
    
    private let voteImage: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
}
