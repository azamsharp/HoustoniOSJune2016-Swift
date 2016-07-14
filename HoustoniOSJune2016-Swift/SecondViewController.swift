//
//  SecondViewController.swift
//  HoustoniOSJune2016-Swift
//
//  Created by Mohammad Azam on 7/14/16.
//  Copyright © 2016 Mohammad Azam. All rights reserved.
//

import UIKit
import CoreMotion

class SecondViewController: UIViewController {

    var manager :CMMotionManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.manager = CMMotionManager()
        
        if self.manager.deviceMotionAvailable {
            
            self.manager.deviceMotionUpdateInterval = 0.1
            
            self.manager.startDeviceMotionUpdatesToQueue(NSOperationQueue.mainQueue(), withHandler: { (data :CMDeviceMotion?, error :NSError?) in
                
                if error == nil {
                    
                    if let data = data {
                        
                        if data.userAcceleration.x < -1.5 {
                            
                            self.navigationController?.popViewControllerAnimated(true)
                            
                        }
                        
                    //    print("x = \(data.userAcceleration.x), y = \(data.userAcceleration.y)")
                    }
                    
                }
                
            })
            
        }
        
        // Do any additional setup after loading the view.
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
