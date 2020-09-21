//
//  MyGroupsController.swift
//  Storyboard Practice
//
//  Created by Алексей Смицкий on 17.09.2020.
//  Copyright © 2020 Смицкий А.Д. All rights reserved.
//

import UIKit

// MARK: - MyGroupsController

final class MyGroupsController: UITableViewController {
    
    // MARK: - Private properties
    
    private lazy var myGroupsList = [String]()
    private lazy var myGroupsImage = [UIImage]()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Actions
    
    @IBAction func addGroup(segue: UIStoryboardSegue) {
        
        if segue.identifier == "addGroup" {
            let newGroupsController = segue.source as? NewGroupsController
            if let indexPath = newGroupsController?.tableView.indexPathForSelectedRow {
                let groupName = newGroupsController?.groupsList[indexPath.row]
                let groupImage = newGroupsController?.groupsImage[indexPath.row]
                
                if !myGroupsList.contains(groupName ?? "") {
                myGroupsList.append(groupName ?? "")
                myGroupsImage.append(groupImage!)
                
                tableView.reloadData()
            }
        }
        }
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myGroupsList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "myGroupsCell", for: indexPath) as?
                MyGroupsCell else { return UITableViewCell() }

        cell.myGroupName?.text = myGroupsList[indexPath.row]
        cell.myGroupImage?.image = myGroupsImage[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle,
                            forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            myGroupsList.remove(at: indexPath.row)
            myGroupsImage.remove(at: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
