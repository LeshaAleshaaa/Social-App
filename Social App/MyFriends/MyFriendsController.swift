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
    
    private lazy var friendsList = ["Кирилл Мальцев",
                                    "Артем Есичев",
                                    "Фрол Гугнин",
                                    "Анастасия Соколова"]
    
    private lazy var friendImage = [UIImage(named: "pizza1"),
        UIImage(named: "pizza2"),
        UIImage(named: "pizza3"),
        UIImage(named: "pizza4")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let controller = segue.destination as! FriendPhotoController
                controller.friendPhotoView = friendImage[indexPath.row]!
            }
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friendsList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "myFriendsCell", for: indexPath) as? MyFriendsCell else { return UITableViewCell() }
        
        let friends = friendsList[indexPath.row]
        let images = friendImage[indexPath.row]
        cell.friendName.text = friends
        cell.friendImage.image = images
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
