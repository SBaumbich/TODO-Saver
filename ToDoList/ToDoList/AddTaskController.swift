//
//  AddTaskController.swift
//  ToDoList
//
//  Created by Scott Baumbich on 5/6/20.
//  Copyright © 2020 Keasbey Nights. All rights reserved.
//

import UIKit
import CoreData

class AddTaskController: UIViewController {
    
    var managedObjectContext: NSManagedObjectContext!
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func save(_ sender: Any) {
        guard let text = textField.text, text.isEmpty == false else {return}
        let item = NSEntityDescription.insertNewObject(forEntityName: "Item", into: managedObjectContext) as! Item

        item.text = text
        managedObjectContext.saveChanges()
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Navigation

}
