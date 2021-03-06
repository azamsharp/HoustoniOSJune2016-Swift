//
//  CameraViewController.swift
//  HoustoniOSJune2016-Swift
//
//  Created by Mohammad Azam on 7/13/16.
//  Copyright © 2016 Mohammad Azam. All rights reserved.
//

import UIKit
import CoreImage

class CameraViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var photoImageView :UIImageView!
    var originalImage :UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func applySepiaFiler() {
        
        let image = self.originalImage
        
        let beginImage = CIImage(image: image)
        
        guard let sepiaFilter = CIFilter(name: "CISepiaTone") else {
            fatalError("Error creating Sepia Filter")
        }
        
        sepiaFilter.setValue(beginImage, forKey: kCIInputImageKey)
        sepiaFilter.setValue(1.0, forKey:kCIInputIntensityKey)
        
        let newImage = UIImage(CIImage: (sepiaFilter.outputImage)!)
        
        self.photoImageView.image = newImage
        
//        dispatch_async(dispatch_get_main_queue()) {
//            self.photoImageView.image = newImage
//        }
    }
    
    @IBAction func openCameraButtonPressed() {
        
        let imagePickerViewController = UIImagePickerController()
        imagePickerViewController.delegate = self
        
        let alertController = UIAlertController(title: "Choose", message: nil, preferredStyle: .ActionSheet)
        
        let pickFromLibraryAction = UIAlertAction(title: "Pick from Library", style: .Default) { (alert :UIAlertAction) in
            
            imagePickerViewController.sourceType = .PhotoLibrary
            self.presentViewController(imagePickerViewController, animated: true, completion: nil)
            
            print("You selected to pick from library")
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (alert :UIAlertAction) in
            
            // nothing here
        }
        
        let takeAPictureAction = UIAlertAction(title: "Take a picture", style: .Default) { (alert :UIAlertAction) in
            
            imagePickerViewController.sourceType = .Camera
            self.presentViewController(imagePickerViewController, animated: true, completion: nil)
            
        }
        
        alertController.addAction(pickFromLibraryAction)
        alertController.addAction(takeAPictureAction)
        alertController.addAction(cancelAction)
        
        self.presentViewController(alertController, animated: true, completion: nil)
        
        
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
         self.originalImage = info[UIImagePickerControllerOriginalImage] as? UIImage
        
        self.photoImageView.image = self.originalImage
        
        picker.dismissViewControllerAnimated(true, completion: nil)
        
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
