//
//  GroceryCategoryTableViewController.swift
//  HoustoniOSJune2016-Swift
//
//  Created by Mohammad Azam on 7/19/16.
//  Copyright © 2016 Mohammad Azam. All rights reserved.
//

import UIKit
import CoreData

class GroceryCategoryTableViewController: UITableViewController, NSFetchedResultsControllerDelegate {

    var managedObjectContext :NSManagedObjectContext!
    var fetchedResultsController :NSFetchedResultsController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let fetchRequest = NSFetchRequest(entityName: "GroceryCategory")
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "title", ascending: true)]
        
        self.fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: self.managedObjectContext, sectionNameKeyPath: nil, cacheName: nil)
        
        self.fetchedResultsController.delegate = self
        
        try! self.fetchedResultsController.performFetch()
    }

    @IBAction func addNewGroceryCategory() {
        
        guard let groceryCategory = NSEntityDescription.insertNewObjectForEntityForName("GroceryCategory", inManagedObjectContext: self.managedObjectContext) as? GroceryCategory else {
            fatalError("GroceryCategory does not exist")
        }
        
        groceryCategory.title = "Breakfast"
        
        //groceryCategory.setValue("Dinner", forKey: "title")
        
        try! self.managedObjectContext.save()

    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        guard let indexPath = self.tableView.indexPathForSelectedRow else {
            fatalError("Invalid IndexPath")
        }
        
        let groceryCategory = self.fetchedResultsController.objectAtIndexPath(indexPath) as! NSManagedObject
        
        
        guard let groceryItemsTableViewController = segue.destinationViewController as? GroceryItemTableViewController else {
            fatalError("Destination controller not found")
        }
        
        groceryItemsTableViewController.groceryCategory = groceryCategory
        groceryItemsTableViewController.managedObjectContext = self.managedObjectContext
        
    }
    
    func controller(controller: NSFetchedResultsController, didChangeObject anObject: AnyObject, atIndexPath indexPath: NSIndexPath?, forChangeType type: NSFetchedResultsChangeType, newIndexPath: NSIndexPath?) {
        
        switch(type) {
            
        case .Insert:
            self.tableView.insertRowsAtIndexPaths([newIndexPath!], withRowAnimation: .Automatic)
            break
            
        case .Delete:
            break
            
        case .Update:
            break
            
        case .Move:
            break
            
        }
        
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let sections = self.fetchedResultsController.sections else {
           fatalError("")
        }
        
        return sections[section].numberOfObjects
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)

        guard let groceryCategory = self.fetchedResultsController.objectAtIndexPath(indexPath) as? GroceryCategory else {
            fatalError("Error getting GroceryCategory")
        }
        
        cell.textLabel?.text = groceryCategory.title
        
        // Configure the cell...

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
