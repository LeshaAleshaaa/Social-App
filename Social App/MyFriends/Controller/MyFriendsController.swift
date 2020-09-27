//
//  MyFriendsController.swift
//  Storyboard Practice
//
//  Created by Алексей Смицкий on 16.09.2020.
//  Copyright © 2020 Смицкий А.Д. All rights reserved.
//

import UIKit

// MARK: - MyFriendsController

final class MyFriendsController: UITableViewController {
    
    // MARK: - Private properties
    
    private lazy var searchBar = UISearchBar()
    private lazy var results = Results()
    private lazy var info = Info()
    private lazy var imagesArray = [UIImageView]()
    private lazy var namesArray = [String]()
    private var parsingResults: INetworkLayer?
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        loadData()
    }

    // MARK: - Private methods
    
    private func loadData() {
        parsingResults = NetworkLayer()
        parsingResults?.getFriendsList(api: URLList.friendList, complition: { [weak self] item in
            guard let self = self else { return }
            
            self.results = item
            DispatchQueue.main.async {
                if let indexPath = self.tableView.indexPathForSelectedRow {
                    let neededData = self.results.response?.items?[indexPath.row]
                    self.namesArray.append(neededData?.first_name ?? "")
                    print(self.namesArray)
                }
                self.results.response?.items?.sort(
                    by: {($0.first_name?.prefix(Constants.prefix) ?? "") <
                        $1.first_name?.prefix(Constants.prefix) ?? ""})
                
//                let groupedDictionary = Dictionary(grouping: (self.results.response?.items)!,
//                                                   by: {String($0.first_name!.prefix(1))})
                // get the keys and sort them
//                let keys = groupedDictionary.keys.sorted()
                self.tableView.reloadData()
            }
        })
    }
    
    // MARK: - Selectors
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Constants.segueIdentifier {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let controller = segue.destination as? FriendPhotoController
                let image = results.response?.items?[indexPath.row]
                controller?.basicViewURL = image?.photo_200_orig
                controller?.friendID = image?.id
                controller?.title = (image?.first_name ?? "") + " " + (image?.last_name ?? "")
            }
        }
    }
}

// MARK: - TableView DataSource

extension MyFriendsController {
    
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        return results.response?.items?.count ?? 0
//    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return results.response?.items?.count ?? Constants.emptyRows
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellName, for: indexPath) as?
                MyFriendsCell else { return UITableViewCell() }
        cell.cellData = results.response?.items?[indexPath.row]
        
        return cell
    }
    
}

// MARK: - Setups

private extension MyFriendsController {
    
    func setupViews() {
        setSearchBar()
    }
    
    func setSearchBar() {
        searchBar.frame = Constants.searchBarFrame
        searchBar.showsCancelButton = true
        searchBar.searchBarStyle = UISearchBar.Style.default
        searchBar.placeholder = Constants.searchBarHolder
        searchBar.sizeToFit()
        tableView.tableHeaderView = searchBar
    }
}

// MARK: - Constants

private extension MyFriendsController {
    
    enum Constants {
        
        static let prefix: Int = 1
        static let sections: Int = 1
        static let emptyRows: Int = 0
        static let segueIdentifier: String = "showDetail"
        static let cellName: String = "myFriendsCell"
        
        static let searchBarFrame: CGRect = CGRect(x: 0, y: 0, width: 200, height: 70)
        static let searchBarHolder: String = "Поиск"
    }
}
