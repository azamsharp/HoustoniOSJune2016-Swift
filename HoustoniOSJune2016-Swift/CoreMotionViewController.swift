//
//  CoreMotionViewController.swift
//  HoustoniOSJune2016-Swift
//
//  Created by Mohammad Azam on 7/14/16.
//  Copyright © 2016 Mohammad Azam. All rights reserved.
//

import UIKit
import CoreMotion

class CoreMotionViewController: UIViewController {

    var manager :CMMotionManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let logoImageView = UIImageView(image: UIImage(named: "TIY-logo-thumb.jpg"))
        
        logoImageView.frame = CGRectMake(75, 100, 300, 300)
        self.view.addSubview(logoImageView)
        
        self.manager = CMMotionManager()
        
        if self.manager.deviceMotionAvailable {
            
            self.manager.deviceMotionUpdateInterval = 0.01
            self.manager.startDeviceMotionUpdatesToQueue(NSOperationQueue.mainQueue(), withHandler: { (data :CMDeviceMotion?, error :NSError?) in
                
                if let data = data {
                    
                    let rotation = atan2(data.gravity.x, data.gravity.y) - M_PI
                    logoImageView.transform = CGAffineTransformMakeRotation(CGFloat(rotation))
                }
                
                
            })
            
        }
        
        
        
//        if self.manager.accelerometerAvailable {
//            
//            self.manager.accelerometerUpdateInterval = 0.1
//            
//            self.manager.startAccelerometerUpdatesToQueue(NSOperationQueue.mainQueue(), withHandler: { (data :CMAccelerometerData?, error :NSError?) in
//                
//                if let data = data {
//
//                    let rotation = atan2(data.acceleration.x,data.acceleration.y) - M_PI
//                    
//                    logoImageView.transform = CGAffineTransformMakeRotation(CGFloat(rotation))
//                    
//                    //                    print("accelerationX = \(data.acceleration.x), accelerationY = \(data.acceleration.y)")
//                }
//                
//            })
//            
//        }
        
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
