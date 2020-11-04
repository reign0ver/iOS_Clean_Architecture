//
//  VotingViewController.swift
//  Cats
//
//  Created by Andres Carrillo on 27/10/20.
//

import UIKit
import Kingfisher

class VotingViewController: UIViewController {

    private let viewModel: VotingViewModel
    
    init(viewModel: VotingViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        setupCatImageView()
        setupButtonsStackView()
        viewModel.getRandomImages()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationBar()
        addTargets()
        view.backgroundColor = UIColor(named: "white_black_color")
    }
    
    private func setupNavigationBar() {
        self.navigationItem.title = viewModel.navigationTitle
        self.navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc
    private func likeAction() {
        viewModel.saveVote(.like)
        viewModel.getRandomImages()
    }
    
    @objc
    private func dislikeAction() {
        viewModel.saveVote(.dislike)
        viewModel.getRandomImages()
    }
    
    private func addTargets() {
        likeButton.addTarget(self, action: #selector(likeAction), for: .touchUpInside)
        dislikeButton.addTarget(self, action: #selector(dislikeAction), for: .touchUpInside)
    }
    
    //MARK: - Constraints

    private func setupCatImageView() {
        view.addSubview(catImageView)
        catImageView.translatesAutoresizingMaskIntoConstraints = false
        let constraints = [
            catImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -80),
            catImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    private func setupButtonsStackView() {
        view.addSubview(buttonsStackView)
        buttonsStackView.translatesAutoresizingMaskIntoConstraints = false
        buttonsStackView.addArrangedSubview(dislikeButton)
        buttonsStackView.addArrangedSubview(likeButton)
        let constraints = [
            buttonsStackView.topAnchor.constraint(equalTo: catImageView.bottomAnchor, constant: 32),
            buttonsStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonsStackView.heightAnchor.constraint(equalToConstant: 50),
            buttonsStackView.widthAnchor.constraint(equalToConstant: 130)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    private func configureView() {
        let url = URL(string: viewModel.image!.url)
        let scale = UIScreen.main.scale
        let processor = ResizingImageProcessor(referenceSize: CGSize(width: 350, height: 350)) |> RoundCornerImageProcessor(cornerRadius: 20)
        catImageView.kf.indicatorType = .activity
        catImageView.kf.setImage(
            with: url,
            options: [
                .processor(processor),
                .scaleFactor(scale),
                .transition(.fade(1)),
        ])
    }
    
    //MARK: - Views
    
    private let catImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private let likeButton: UIButton = {
        let button = UIButton()
        let buttonImage = UIImage(named: "full_heart")
        button.setImage(buttonImage, for: .normal)
        return button
    }()
    
    private let dislikeButton: UIButton = {
        let button = UIButton()
        let buttonImage = UIImage(named: "dislike")
        button.setImage(buttonImage, for: .normal)
        return button
    }()
    
    private let buttonsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 32
        return stackView
    }()
}

//MARK: - ViewModel Delegate

extension VotingViewController: VotingViewModelDelegate {
    func updateView() {
        DispatchQueue.main.async {
            self.configureView()
        }
    }
}
