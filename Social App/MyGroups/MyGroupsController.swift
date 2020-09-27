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
    private var parsingResults: INetworkLayer?
    private lazy var results = MyGroupsResults()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }
    
    // MARK: - Private methods
    
    private func loadData() {
        parsingResults = NetworkLayer()
        parsingResults?.getMyGroups(api: URLList.groupsApi, complition: { [weak self] item in
            guard let self = self else { return }
            
            self.results = item
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        })
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
    
    // MARK: - TableView data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.response?.items?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "myGroupsCell", for: indexPath) as?
                MyGroupsCell else { return UITableViewCell() }
        
        cell.cellData = results.response?.items?[indexPath.row]
        
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
