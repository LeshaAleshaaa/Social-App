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
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    // MARK: - Selectors
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let controller = segue.destination as! FriendPhotoController
                controller.friendPhotoView = friendList[indexPath.row].1
            }
        }
    }
}

// MARK: - Setups

private extension MyFriendsController {
    
    func setupViews() {
        setFriendsList()
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
}

// MARK: - TableView DataSource

extension MyFriendsController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return friendSectionTitle.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let friendKey = friendSectionTitle[section]
        if let friendValues = friendsDictionary[friendKey] {
            return friendValues.count
        }
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "myFriendsCell", for: indexPath) as? MyFriendsCell else { return UITableViewCell() }
        
        let friendKey = friendSectionTitle[indexPath.section]
        if let friendValues = friendsDictionary[friendKey] {
            cell.friendName.text = friendValues[indexPath.row].0
            cell.friendImage.image = friendValues[indexPath.row].1
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return friendSectionTitle[section]
    }
    
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return friendSectionTitle
    }
}
