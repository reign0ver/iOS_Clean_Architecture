//
//  ListOfBreedsViewController.swift
//  Cats
//
//  Created by Andres Carrillo on 21/10/20.
//

import UIKit

class ListOfBreedsViewController: UITableViewController {
    
    private let viewModel: BreedsViewModel
    
    init(viewModel: BreedsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(BreedsCell.self, forCellReuseIdentifier: BreedsCell.reuseIdentifier)
        tableView.register(StaticItalicTextCell.self, forCellReuseIdentifier: StaticItalicTextCell.reuseIdentifier)
        getListOfBreeds()
        viewModel.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        self.navigationItem.title = viewModel.navigationTitle
        self.navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
    }
    
    private func getListOfBreeds() {
        showLoading()
        viewModel.getListOfBreeds()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

//MARK: - TableView Delegate and DataSource

extension ListOfBreedsViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var headerTitle = ""
        switch section {
        case 0:
            headerTitle = "Welcome! :)"
        case 1:
            headerTitle = "List of breeds"
        default:
            headerTitle = ""
        }
        return headerTitle
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? 1 : viewModel.breeds.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BreedsCell.reuseIdentifier) as! BreedsCell
        let descriptionCell = tableView.dequeueReusableCell(withIdentifier: StaticItalicTextCell.reuseIdentifier) as! StaticItalicTextCell
        
        switch indexPath.section {
        case 0:
            let description = "Heeeey stranger! If you love cats you're on the right spot:).  To get more info about cat breeds please select one from below :D"
            descriptionCell.configure(description)
            return descriptionCell
        case 1:
            let currentBreed = viewModel.breeds[indexPath.row]
            cell.configure(currentBreed)
            return cell
        default:
            break
        }
        return UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let currentBreed = viewModel.breeds[indexPath.row]
        let vc = BreedDetailsViewController(currentBreed, (AppDelegate.shared?.diManager.getContainer().resolve(BreedDetailsViewModel.self))!)
        vc.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(vc, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

//MARK: - ViewModel Delegate

extension ListOfBreedsViewController: BreedsViewModelDelegate {
    func reloadData() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
            self.hideLoading()
        }
    }
}

