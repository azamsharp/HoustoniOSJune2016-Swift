//
//  MapsViewController.swift
//  HoustoniOSJune2016-Swift
//
//  Created by Mohammad Azam on 7/27/16.
//  Copyright © 2016 Mohammad Azam. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapsViewController: UIViewController, CLLocationManagerDelegate,MKMapViewDelegate {

    @IBOutlet weak var mapView :MKMapView!
    @IBOutlet weak var ironYardView :UIView!
    
    var locationManager :CLLocationManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.locationManager = CLLocationManager()
        self.locationManager.delegate = self
        self.mapView.delegate = self
        
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.distanceFilter = kCLDistanceFilterNone
        
        self.locationManager.requestWhenInUseAuthorization()
        
        self.locationManager.startUpdatingLocation()
        
        self.mapView.showsUserLocation = true
        
    }
    
    
    
    func mapView(mapView: MKMapView, didAddAnnotationViews views: [MKAnnotationView]) {
        
        if let annotationView = views.first {
            
            if let annotation = annotationView.annotation {
                if annotation is MKUserLocation {
                    
                    let region = MKCoordinateRegionMakeWithDistance(annotation.coordinate, 250, 250)
                    self.mapView.setRegion(region, animated: true)
                    
                }
            }
        }
        
    }
    
    @IBAction func addAnnotationButtonPressed() {
        
        let pinAnnotation = MKPointAnnotation()
        pinAnnotation.title = "This is a Pizza store"
        pinAnnotation.coordinate = CLLocationCoordinate2D(latitude: 37.331210, longitude: -122.030522)
        
//        pinAnnotation.coordinate = self.mapView.userLocation.coordinate
        
        self.mapView.addAnnotation(pinAnnotation)
        
    }
    
    private func createAccessoryView() -> UIView {
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
        view.backgroundColor = UIColor.redColor()
        
        let widthConstraint = NSLayoutConstraint(item: view, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: 300)
        view.addConstraint(widthConstraint)
        
        let heightConstraint = NSLayoutConstraint(item: view, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: 300)
        view.addConstraint(heightConstraint)
        
        return view
        
    }
    
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        
        if annotation is MKUserLocation {
            return nil
        }
        
        var pizzaAnnotationView = self.mapView.dequeueReusableAnnotationViewWithIdentifier("PizzaAnnotationView")
        
        if pizzaAnnotationView == nil {
            // create the annotation view 
            pizzaAnnotationView = PizzaAnnotationView(annotation: annotation, reuseIdentifier: "PizzaAnnotationView")
        }

        pizzaAnnotationView?.canShowCallout = true
        
        let pizzaImageView = UIImageView(image: UIImage(named: "pizza"))
        
      //  pizzaAnnotationView?.detailCalloutAccessoryView = createAccessoryView()
        
        
        pizzaAnnotationView?.detailCalloutAccessoryView = self.ironYardView
        
        return pizzaAnnotationView
        
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("didUpdateLocations")
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
