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
    
    private lazy var friendsDictionary = [String: [(String, UIImage)]]()
    private lazy var friendSectionTitle = [String]()
    private lazy var friendList = [(String, UIImage)]()
    private lazy var friendsPrefix = [String]()
    private lazy var searchBar = UISearchBar()
    private lazy var friendsSearch = [String: [(String, UIImage)]]()
    private lazy var friendSearchTitle = [String]()
    private lazy var searchingStatus = false
    private lazy var results = Results()
    private var parsingResults: INetworkLayer?
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        loadData(whichApi: "https://api.vk.com/method/friends.get?user_ids=leshaaleshaaa&fields=bdate&access_token=f0d4dc90c3ed349153d83e9a52b11cb019bd73cd42b7ff3a1a4a287b4471784bda5ddf4ca321f9955a526&v=5.124")
    }
    
    // MARK: - Selectors
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let controller = segue.destination as! FriendPhotoController
                controller.friendPhotoView.image = friendList[indexPath.row].1
            }
        }
    }
    
    private func loadData(whichApi: String) {
        parsingResults = NetworkLayer()
        parsingResults?.getJSON(api: whichApi, complition: { [weak self] item in
            guard let self = self else { return }
            
            self.results = item
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        })
    }
}

// MARK: - Setups

private extension MyFriendsController {
    
    func setupViews() {
//        setFriendsList()
        setSearchBar()
    }
    
    func setFriendsList() {
        friendList = [("Кирилл Мальцев", UIImage(named: "pizza1")!),
                      ("Артем Есичев", UIImage(named: "pizza2")!),
                      ("Фрол Гугнин", UIImage(named: "pizza3")!),
                      ("Анастасия Соколова", UIImage(named: "pizza4")!)]
        
        for friend in friendList {
            let friendKey = String(friend.0.prefix(1))
            if var friendValues = friendsDictionary[friendKey] {
                friendValues.append((friend.0, friend.1))
                friendsDictionary[friendKey] = friendValues
            } else {
                friendsDictionary[friendKey] = [(friend.0, friend.1)]
            }
        }
        friendSectionTitle = [String](friendsDictionary.keys)
        friendSectionTitle = friendSectionTitle.sorted(by: { $0 < $1 })
    }
    
    func setSearchBar() {
        searchBar.frame = CGRect(x: 0, y: 0, width: 200, height: 70)
        searchBar.delegate = self
        searchBar.showsCancelButton = true
        searchBar.searchBarStyle = UISearchBar.Style.default
        searchBar.placeholder = " Поиск"
        searchBar.sizeToFit()
        tableView.tableHeaderView = searchBar
    }
}

// MARK: - TableView DataSource

extension MyFriendsController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
//        return friendSectionTitle.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.response?.items?.count ?? 0
//
//        let friendKey = friendSectionTitle[section]
//        if searchingStatus {
//            if let searchValues = friendsSearch[friendKey] {
//                return searchValues.count
//            }
//        } else {
//            if let friendValues = friendsDictionary[friendKey] {
//                return friendValues.count
//            }
//        }
//        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "myFriendsCell", for: indexPath) as? MyFriendsCell else { return UITableViewCell() }
        cell.cellData = results.response?.items?[indexPath.row]
//        let friendKey = friendSectionTitle[indexPath.section]
//        if searchingStatus {
//            if let searchValues = friendsSearch[friendKey] {
//                cell.friendName.text = searchValues[indexPath.row].0
//                cell.friendImage.image = searchValues[indexPath.row].1
//            }
//        } else {
//            if let friendValues = friendsDictionary[friendKey] {
//                cell.friendName.text = friendValues[indexPath.row].0
//                cell.friendImage.image = friendValues[indexPath.row].1
//            }
//        }
        return cell
    }
    
//    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return friendSectionTitle[section]
//    }
//    
//    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
//        if searchingStatus {
//            return friendSearchTitle
//        } else {
//            return friendSectionTitle
//        }
//    }
}

// MARK: - SearchBar Delegate

extension MyFriendsController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        friendsSearch = friendsDictionary.filter({$0.key.prefix(searchText.count) == searchText})
        friendSearchTitle = friendSectionTitle.filter({$0.prefix(searchText.count) == searchText})
        searchingStatus = true
        tableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        searchingStatus = false
        searchBar.text = ""
        tableView.reloadData()
    }
}
