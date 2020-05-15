//
//  CoreDataStack.swift
//  ToDoList
//
//  Created by Scott Baumbich on 5/5/20.
//  Copyright © 2020 Keasbey Nights. All rights reserved.
//

import Foundation
import CoreData

class CoreDataStack {
    
/*
     // Old way of using CoreDate
     private(set) lazy var applicationDocumentsDirectoy: URL = {
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let endIndex = urls.index(before: urls.endIndex)
        return urls[endIndex]
    }()

    private(set) lazy var managedObjectModel: NSManagedObjectModel = {
        let modelURL = Bundle.main.url(forResource: "ToDoList", withExtension: "momd")!
        return NSManagedObjectModel(contentsOf: modelURL)!
        
    }()

    private(set) lazy var persistentStoreCoordinator: NSPersistentStoreCoordinator = {
        let coordinator = NSPersistentStoreCoordinator(managedObjectModel: self.managedObjectModel)
        let url = self.applicationDocumentsDirectoy.appendingPathComponent("ToDoList.sqlite")
        do {
            try coordinator.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: url, options: nil)
        } catch {
            print(error.localizedDescription)
            abort()
        }
        return coordinator
    }()

    lazy var managedObjectContext: NSManagedObjectContext = {
        let coordinator = self.persistentStoreCoordinator
        let moc = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        moc.persistentStoreCoordinator = coordinator
        return moc
        
    }()
*/
    
    lazy var managedObjectContext: NSManagedObjectContext = {
        let continer = self.persistentContainer
        return continer.viewContext
    }()
    
    private lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "ToDoList")
        container.loadPersistentStores(){ storeDescription, error in
            if let error = error as NSError? {
                fatalError("Unresolved Error: \(error), \(error.userInfo)")
            }
        }
        return container
    }()

}

extension NSManagedObjectContext {
    func saveChanges() {
        if self.hasChanges {
            do {
                try self.save()
            } catch {
                fatalError("Error: \(error.localizedDescription)")
            }
        }
    }
}



