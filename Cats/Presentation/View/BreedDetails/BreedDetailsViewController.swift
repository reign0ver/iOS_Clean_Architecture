//
//  BreedDetailsViewController.swift
//  Cats
//
//  Created by Andres Carrillo on 27/10/20.
//

import UIKit

class BreedDetailsViewController: UITableViewController {
    
    private let breed: Breed
    private let viewModel: BreedDetailsViewModel
    
    init(_ breed: Breed, _ viewModel: BreedDetailsViewModel) {
        self.breed = breed
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        viewModel.getBreedImageURL(breed.id)
        tableView.register(ImageBreedStaticCell.self, forCellReuseIdentifier: ImageBreedStaticCell.reuseIdentifier)
        tableView.register(BreedInformationCell.self, forCellReuseIdentifier: BreedInformationCell.reuseIdentifier)
        tableView.allowsSelection = false
        tableView.isUserInteractionEnabled = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        self.navigationItem.title = breed.name
        self.navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

//MARK: - TableView Delegate and DataSource

extension BreedDetailsViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let imageCell = tableView.dequeueReusableCell(withIdentifier: ImageBreedStaticCell.reuseIdentifier) as! ImageBreedStaticCell
        let informationCell = tableView.dequeueReusableCell(withIdentifier: BreedInformationCell.reuseIdentifier) as! BreedInformationCell
        
        switch indexPath.section {
        case 0:
            imageCell.configure(viewModel.imageURL)
            return imageCell
        case 1:
            informationCell.configure(breed)
            informationCell.delegate = self
            return informationCell
        default:
            break
        }
        
        return UITableViewCell()
    }
}

//MARK:- ViewModel Delegate

extension BreedDetailsViewController: ImageViewModelDelegate {
    func updateImageURL() {
        DispatchQueue.main.async {
            let indexPath = IndexPath(row: 0, section: 0)
            let cell = self.tableView.cellForRow(at: indexPath) as! ImageBreedStaticCell
            cell.configure(self.viewModel.imageURL)
        }
    }
}

//MARK: - Delegate for the WikipediaButton inside the cell

extension BreedDetailsViewController: GoToWebViewDelegate {
    func presentWebView(vc: WikipediaWebViewController) {
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
