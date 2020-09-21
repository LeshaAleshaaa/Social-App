//
//  NewGroupsController.swift
//  Storyboard Practice
//
//  Created by Алексей Смицкий on 17.09.2020.
//  Copyright © 2020 Смицкий А.Д. All rights reserved.
//

import UIKit

// MARK: - NewGroupsController

final class NewGroupsController: UITableViewController {

    // MARK: - Private properties
    
    lazy var groupsList = ["Автомобили",
                                   "Природа",
                                   "Образование",
                                   "Политика",
                                   "Игры"]
    
    lazy var groupsImage = [UIImage(named: "pizza1"),
                                    UIImage(named: "pizza2"),
                                    UIImage(named: "pizza3"),
                                    UIImage(named: "pizza4"),
                                    UIImage(named: "star")]
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return groupsList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "newGroupsCell", for: indexPath) as?
                NewGroupsCell else { return UITableViewCell() }
        
        cell.groupName?.text = groupsList[indexPath.row]
        cell.groupImage?.image = groupsImage[indexPath.row]
        
        return cell
    }
}
