//
//  VegetableListTableViewController.swift
//  HoustoniOSJune2016-Swift
//
//  Created by Mohammad Azam on 7/25/16.
//  Copyright © 2016 Mohammad Azam. All rights reserved.
//

import UIKit

class VegetableListTableViewController: UITableViewController {

    var vegetables = [Vegetable]()
    
    var countLabel :UILabel = UILabel()
    
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
        populateVegetables()
        
    }
    
    func buttonPressed(button :UIButton) {
        
        count += 1
        
        
        
           }
    
    private func populateVegetables() {
        
        
        
        let vegetableAPI = "http://jsonplaceholder.typicode.com/photos"
        
        guard let url = NSURL(string: vegetableAPI) else {
            fatalError("Invalid URL")
        }
        
        let session = NSURLSession.sharedSession()
        
        
        session.dataTaskWithURL(url) { (data :NSData?, response :NSURLResponse?, error :NSError?) in
            
            guard let jsonResult = NSString(data: data!, encoding: NSUTF8StringEncoding) else {
                fatalError("Unable to format data")
            }
            
            let jsonVegetablesArray = try! NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.AllowFragments) as! [AnyObject]
            
            
            for item in jsonVegetablesArray {
                
                let vegetable = Vegetable()
                vegetable.title = item.valueForKey("title") as! String
                vegetable.thumbnailUrl = item.valueForKey("thumbnailUrl") as! String
                
                self.vegetables.append(vegetable)
                
            }
            
            // loop ended I can refresh the tableview 
            dispatch_async(dispatch_get_main_queue(), { 
                // this is the main/ui thread 
                self.tableView.reloadData()
                
            })
            
           
            
        }.resume()
        
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
        // #warning Incomplete implementation, return the number of rows
        return self.vegetables.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCellWithIdentifier("VegetableCell", forIndexPath: indexPath)

        let vegetable = self.vegetables[indexPath.row]
        
        guard let imageURL = NSURL(string: vegetable.thumbnailUrl) else {
            fatalError("Invalid URL")
        }
        
        let imageData = NSData(contentsOfURL: imageURL)
        
        let image = UIImage(data: imageData!)
        
        cell.imageView?.image = image
        
        print(vegetable.thumbnailUrl)
        
        cell.textLabel?.text = vegetable.title

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
