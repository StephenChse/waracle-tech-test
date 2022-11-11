//
//  CakeListViewController.swift
//  CakeItApp
//
//  Created by David McCallum on 20/01/2021.
//

import UIKit

class CakeListViewController: UIViewController, ControllerTitle {
   
    //MARK: Properties
    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(handleRefresh(_:)), for: .valueChanged)
        return refreshControl
    }()
   
    @IBOutlet weak var tableView: UITableView? {
        didSet {
            tableView?.delegate = self
            tableView?.dataSource = self
            tableView?.register(UINib(nibName: "CakeTableViewCell", bundle: nil), forCellReuseIdentifier: "CakeTableViewCell")
        }
    }
    
   var viewModel: CakeListViewModel!
    
    //MARK: View Methods
   override func viewDidLoad() {
        super.viewDidLoad()
        setTitle(title: CakeListViewModel.Constant.title)
        tableView?.addSubview(refreshControl)
        fetchCakes()
    }

    //MARK: Extra Methods
    
    func fetchCakes() {
        Task {
            try await viewModel.fetchCakeList()
            tableView?.reloadData()
        }
    }
    
    @objc func handleRefresh(_ refreshControl: UIRefreshControl) {
        Task {
            try? await viewModel.fetchCakeList()
            tableView?.reloadData()
            refreshControl.endRefreshing()
        }
    }
}

//MARK: TableView Delegate, DataSource
extension CakeListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.cakeList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CakeTableViewCell = tableView.initiate(indexPath: indexPath)
        let cakeViewModel = viewModel.cellForRowData(indexPath: indexPath)
        cell.setData(cakeViewModel: cakeViewModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.navigateToDetail(indexPath: indexPath)
    }
}

