//
//  HelloWorldViewController.swift
//  HoustoniOSJune2016-Swift
//
//  Created by Mohammad Azam on 7/11/16.
//  Copyright © 2016 Mohammad Azam. All rights reserved.
//

import UIKit

class HelloWorldViewController: UIViewController {

    @IBOutlet weak var messageLabel :UILabel!
    //@IBOutlet weak var greetingsLabel  :UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //self.greetingsLabel?.text
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonPressed() {
        
        self.messageLabel.text = "Hello World"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
