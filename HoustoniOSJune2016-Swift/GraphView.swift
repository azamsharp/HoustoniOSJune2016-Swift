//
//  GraphView.swift
//  HoustoniOSJune2016-Swift
//
//  Created by Mohammad Azam on 7/12/16.
//  Copyright © 2016 Mohammad Azam. All rights reserved.
//

import UIKit

@IBDesignable
class GraphView: UIView {
    
    @IBInspectable var cornerRadius :CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
            self.layer.masksToBounds = true
        }
    }
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
        let anotherView = UIView(frame: CGRectMake(20,50,50,50))
        
        
        anotherView.backgroundColor = UIColor.cyanColor()
        self.addSubview(anotherView)
        
       // setup()
    }
    
//    func setup() {
//        
//        self.layer.cornerRadius = 10.0
//        self.layer.masksToBounds = true
//    }
//    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
        
        UIColor.greenColor().setFill()
        let circle = UIBezierPath(ovalInRect: CGRect(x: 100, y: 100, width: 100, height: 100))
        
        circle.fill()
        circle.closePath()
        
        UIColor.redColor().setStroke()
        UIColor.blueColor().setFill()
        let line = UIBezierPath()
        line.fill()
        line.moveToPoint(CGPoint(x: 100, y: 100))
        line.addLineToPoint(CGPoint(x: 120, y: 200))
        line.addLineToPoint(CGPoint(x: 20, y: 0))
        line.addLineToPoint(CGPoint(x: 100, y: 100))
        line.stroke()
        line.fill()
        line.closePath()
    }
    

}
