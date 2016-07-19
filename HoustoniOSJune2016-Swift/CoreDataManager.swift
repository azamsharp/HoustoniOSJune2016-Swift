//
//  CoreDataManager.swift
//  HoustoniOSJune2016-Swift
//
//  Created by Mohammad Azam on 7/19/16.
//  Copyright © 2016 Mohammad Azam. All rights reserved.
//

import UIKit
import CoreData

class CoreDataManager: NSObject {

    var managedObjectContext :NSManagedObjectContext!
    
    override init() {
        
        guard let url = NSBundle.mainBundle().URLForResource("GroceryAppModel", withExtension: "momd") else {
            fatalError("GroceryAppModel not found")
        }
        
        guard let managedObjectModel = NSManagedObjectModel(contentsOfURL: url) else {
            fatalError("ManagedObjectModel does not exist")
        }
        
        let persistentStoreCoordinator = NSPersistentStoreCoordinator(managedObjectModel: managedObjectModel)
        
        
        let fileManager = NSFileManager()
        
        
        guard let documentsURL = fileManager.URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first else {
            fatalError("Documents Directory does not exist")
        }
        
        print(documentsURL)
        
        let storeURL = documentsURL.URLByAppendingPathComponent("GroceryAppDatabase.sqlite")
        
        print(storeURL)
        
        try! persistentStoreCoordinator.addPersistentStoreWithType(NSSQLiteStoreType, configuration: nil, URL: storeURL, options: nil)
        
        let type = NSManagedObjectContextConcurrencyType.MainQueueConcurrencyType
        
        self.managedObjectContext = NSManagedObjectContext(concurrencyType: type)
        
        self.managedObjectContext.persistentStoreCoordinator = persistentStoreCoordinator
        
    }
    
}
