//
//  PizzaAnnotationView.swift
//  HoustoniOSJune2016-Swift
//
//  Created by Mohammad Azam on 7/27/16.
//  Copyright © 2016 Mohammad Azam. All rights reserved.
//

import UIKit
import MapKit

class PizzaAnnotationView: MKAnnotationView {

    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        
        setupAnnotationView()
    }
    
    private func setupAnnotationView() {
        
        self.frame.size = CGSize(width: 60, height: 60)
        self.centerOffset = CGPoint(x: -5, y: -5)
        
        let imageView = UIImageView(image: UIImage(named: "pizza"))
        imageView.frame = self.frame
        self.addSubview(imageView)
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
