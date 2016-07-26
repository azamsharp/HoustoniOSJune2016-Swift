//
//  PostingDataViewController.swift
//  HoustoniOSJune2016-Swift
//
//  Created by Mohammad Azam on 7/26/16.
//  Copyright © 2016 Mohammad Azam. All rights reserved.
//

import UIKit

class PostingDataViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func postingButtonPressed() {
     
        let url = "http://jsonplaceholder.typicode.com/posts"
        
        guard let apiURL = NSURL(string: url) else {
            fatalError("URL incorrect")
        }
        
        let session = NSURLSession.sharedSession()
        let request = NSMutableURLRequest(URL: apiURL)
        request.HTTPMethod = "POST"
        
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let parameters = ["title":"foo","body":"var","userId":1]
        
//        do {
//            try NSJSONSerialization.dataWithJSONObject(parameters, options: .PrettyPrinted)
//        }
//        catch  {
//            print("Opps")
//        }
        
        request.HTTPBody = try! NSJSONSerialization.dataWithJSONObject(parameters, options: .PrettyPrinted)
        
        session.dataTaskWithRequest(request) { (data :NSData?, response :NSURLResponse?, error: NSError?) in
            
            
            print("finished")
            
        }.resume()
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
