//
//  FitnessViewController.swift
//  HoustoniOSJune2016-Swift
//
//  Created by Mohammad Azam on 7/14/16.
//  Copyright © 2016 Mohammad Azam. All rights reserved.
//

import UIKit
import CoreMotion

class FitnessViewController: UIViewController {

    var pedemeter :CMPedometer!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.pedemeter = CMPedometer()
        
        self.pedemeter.startPedometerUpdatesFromDate(NSDate()) { (data :CMPedometerData?, error :NSError?) in
            
        }
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func queryPedometerDataButtonPressed() {
     
        let calendar = NSCalendar.currentCalendar()
        let startDate = calendar.dateByAddingUnit(.Day, value: -1, toDate: NSDate(), options: [])
        
        print(startDate)
        
        self.pedemeter.queryPedometerDataFromDate(startDate!, toDate: NSDate()) { (data :CMPedometerData?, error :NSError?) in
            
            if let data = data {
                print(data.numberOfSteps)
            }
            
            
        }
        
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
