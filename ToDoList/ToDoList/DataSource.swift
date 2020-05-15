//
//  DataSource.swift
//  ToDoList
//
//  Created by Scott Baumbich on 5/8/20.
//  Copyright © 2020 Keasbey Nights. All rights reserved.
//

import Foundation
import UIKit
import CoreData


class DataSource: NSObject, UITableViewDataSource {
    
    private let tableView: UITableView
    private let context: NSManagedObjectContext
    
    lazy var fetchedResultsController: ToDoFetchedResultsController = {
        return ToDoFetchedResultsController(managedObjectContext: self.context, tableView: self.tableView)
    }()
    
    init(tableView: UITableView, context: NSManagedObjectContext){
        self.tableView = tableView
        self.context = context
    }
        
    func object(at indexPath: IndexPath) -> Item {
        return fetchedResultsController.object(at: indexPath)
    }
    // MARK: - Table view data source

    func numberOfSections(in tableView: UITableView) -> Int {
        return fetchedResultsController.sections?.count ?? 0
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let section = fetchedResultsController.sections?[section] else {
            return 0
        }
        return section.numberOfObjects
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "todocell", for: indexPath)
        return configureCell(cell, at: indexPath)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        let item = fetchedResultsController.object(at: indexPath)
        context.delete(item)
        context.saveChanges()
    }
    
    private func configureCell(_ cell: UITableViewCell, at indexpath: IndexPath) -> UITableViewCell {
        let item = fetchedResultsController.object(at: indexpath)
        cell.textLabel?.text = item.text
        return cell
    }
    
    
    
}
