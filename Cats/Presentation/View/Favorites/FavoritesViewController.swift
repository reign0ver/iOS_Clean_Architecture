//
//  FavoritesViewController.swift
//  Cats
//
//  Created by Andres Carrillo on 3/11/20.
//

import UIKit

class FavoritesViewController: UITableViewController {
    
    private let viewModel: VotingViewModel
    
    init(_ viewModel: VotingViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


//MARK : TableView Delegate and DataSource
extension FavoritesViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
