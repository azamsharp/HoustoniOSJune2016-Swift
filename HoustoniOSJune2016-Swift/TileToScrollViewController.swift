//
//  TileToScrollViewController.swift
//  HoustoniOSJune2016-Swift
//
//  Created by Mohammad Azam on 7/18/16.
//  Copyright © 2016 Mohammad Azam. All rights reserved.
//

import UIKit
import CoreMotion

class TileToScrollViewController: UIViewController {

    var coreMotionManager :CMMotionManager!
    @IBOutlet weak var textView :UITextView! 
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
        
        // Do any additional setup after loading the view.
    }
    
    
    private func setup() {
        
        var speed :CGFloat = 0.0
        var positionY :CGFloat = 0.0
        
        self.coreMotionManager = CMMotionManager()
        
        if self.coreMotionManager.deviceMotionAvailable {
            
            self.coreMotionManager.deviceMotionUpdateInterval = 0.2
            
            self.coreMotionManager.startDeviceMotionUpdatesToQueue(NSOperationQueue.mainQueue()) { (data :CMDeviceMotion?, error: NSError?) in
                
                guard let accelerationY = data?.gravity.y else {
                    fatalError("Gravity is not defined!")
                }
                
                if accelerationY >= -0.58 && accelerationY <= -0.27 {
                    
                    print("going up")
                    
                    speed = 1
                    positionY += self.textView.frame.origin.y + speed
                    let newOffset = CGPointMake(0, positionY)
                    self.textView.setContentOffset(newOffset, animated: true)
                }
                    
                else if accelerationY >= -0.92 && accelerationY <= -0.86 {
                   
                    print("going down")
                    
                    speed = 1
                    positionY -= self.textView.frame.origin.y + speed
                    let newOffset = CGPointMake(0, positionY)
                    self.textView.setContentOffset(newOffset, animated: true)
                }
                // print the accelerationY
                
                
            }
            
        }
        
        
        
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
