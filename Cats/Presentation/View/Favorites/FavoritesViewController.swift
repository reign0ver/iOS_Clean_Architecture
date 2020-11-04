//
//  FavoritesViewController.swift
//  Cats
//
//  Created by Andres Carrillo on 3/11/20.
//

import UIKit

class FavoritesViewController: UITableViewController {
    
    private let viewModel: FavoritesViewModel
    
    init(_ viewModel: FavoritesViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getAllVotes()
        setupNavigationBar()
    }
    
    private func getAllVotes() {
        viewModel.getAllVotes()
        tableView.reloadData()
    }
    
    private func setupNavigationBar() {
        self.navigationItem.title = viewModel.navigationTitle
        self.navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
    }
    
    private func setupTableView() {
        tableView.register(FavoritesCell.self, forCellReuseIdentifier: FavoritesCell.reuseIdentifier)
        tableView.allowsSelection = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


//MARK : TableView Delegate and DataSource
extension FavoritesViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.votes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FavoritesCell.reuseIdentifier) as! FavoritesCell
        let currentVote = viewModel.votes[indexPath.row]
        cell.configure(vote: currentVote)
        
        return cell
    }
}
