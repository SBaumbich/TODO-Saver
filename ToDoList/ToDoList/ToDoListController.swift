//
//  ToDoListController.swift
//  ToDoList
//
//  Created by Scott Baumbich on 5/6/20.
//  Copyright © 2020 Keasbey Nights. All rights reserved.
//

import UIKit
import CoreData

class ToDoListController: UITableViewController {

    let managedObjectContext = CoreDataStack().managedObjectContext
    lazy var dataSource: DataSource = {
        return DataSource(tableView: self.tableView, context: self.managedObjectContext)
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = dataSource
    }
    
    //MARK: UITableViewDelegate
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return.delete
    }
    
    //MARK: - Navagation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "newitem" {
            let navagationController = segue.destination as! UINavigationController
            let addTaskController = navagationController.topViewController as! AddTaskController
            addTaskController.managedObjectContext = self.managedObjectContext
        } else if segue.identifier == "showdetail" {
            guard let detailViewController = segue.destination as? DetailViewController, let indexPath = tableView.indexPathForSelectedRow else {
                return // TODO: - Error Handeling
            }
            
            let item = dataSource.object(at: indexPath)
            detailViewController.item = item
            detailViewController.context = self.managedObjectContext
        }
    }
}

