//
//  DetailViewController.swift
//  ToDoList
//
//  Created by Scott Baumbich on 5/8/20.
//  Copyright © 2020 Keasbey Nights. All rights reserved.
//

import Foundation
import UIKit
import CoreData
class DetailViewController: UIViewController  {
    
    var context: NSManagedObjectContext?
    var item: Item?
    @IBOutlet weak var detailTextField: UITextField!
    
    override func viewDidLoad() {
        if let item = item {
            detailTextField.text = item.text
        }
    }
    
    @IBAction func save(_ sender: Any) {
        if let item = item, let newText = detailTextField.text {
            item.text = newText 
            context?.saveChanges()
            navigationController?.popViewController(animated: true)
        }
        
    }
    
    @IBAction func deleteItem(_ sender: Any) {
        if let item = item {
            context?.delete(item)
            context?.saveChanges()
            navigationController?.popViewController(animated: true)
             
        }
    }
    
}
