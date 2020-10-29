//
//  BreedInformationCell.swift
//  Cats
//
//  Created by Andres Carrillo on 27/10/20.
//

import UIKit

protocol GoToWebViewDelegate: class {
    func presentWebView(vc: WikipediaWebViewController)
}

class BreedInformationCell: UITableViewCell {

    static let reuseIdentifier = String(describing: BreedInformationCell.self)
    
    private var wikipediaURL: String = ""
    weak var delegate: GoToWebViewDelegate?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: BreedInformationCell.reuseIdentifier)
        setupDescriptionLabel()
        setupOriginLabel()
        setupTemperamentLabel()
        setupWikipediaButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupDescriptionLabel() {
        contentView.addSubview(descriptionLabel)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        let constraints = [
            descriptionLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    private func setupOriginLabel() {
        contentView.addSubview(originLabel)
        originLabel.translatesAutoresizingMaskIntoConstraints = false
        let constraints = [
            originLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
            originLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            originLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    private func setupTemperamentLabel() {
        contentView.addSubview(temperamentLabel)
        temperamentLabel.translatesAutoresizingMaskIntoConstraints = false
        let constraints = [
            temperamentLabel.topAnchor.constraint(equalTo: originLabel.bottomAnchor, constant: 16),
            temperamentLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            temperamentLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    private func setupWikipediaButton() {
        contentView.addSubview(wikipediaURLButton)
        wikipediaURLButton.translatesAutoresizingMaskIntoConstraints = false
        let constraints = [
            wikipediaURLButton.topAnchor.constraint(equalTo: temperamentLabel.bottomAnchor, constant: 16),
            wikipediaURLButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            wikipediaURLButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    
    func configure(_ breed: Breed) {
        descriptionLabel.text = "Description:\n\(breed.description)"
        originLabel.text  = "Origin: \n\(breed.name) is from \(breed.origin)"
        let temperament = breed.temperament
            .replacingOccurrences(of: ",", with: "\n")
            .replacingOccurrences(of: " ", with: "* ")
        temperamentLabel.text = "Its temperament is more like:\n* \(temperament)"
        wikipediaURL = breed.wikipediaURL ?? ""
        wikipediaURLButton.addTarget(self, action: #selector(goToWikipedia), for: .touchUpInside)
    }
    
    @objc
    private func goToWikipedia() {
        print("MALDI - TASEA")
        let vc = WikipediaWebViewController(webViewURL: wikipediaURL)
        vc.modalPresentationStyle = .fullScreen
        delegate?.presentWebView(vc: vc)
    }
    
    
    //MARK: - Views
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        
        return label
    }()
    
    private let originLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        
        return label
    }()
    
    private let temperamentLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        
        return label
    }()
    
    private lazy var wikipediaURLButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Tap here Wikipedia", for: .normal)
        button.isUserInteractionEnabled = true
        button.isEnabled = true
        
        return button
    }()
    
}
