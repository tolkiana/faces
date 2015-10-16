//
//  ViewController.swift
//  faces
//
//  Created by Nelida Velázquez on 10/12/15.
//  Copyright © 2015 Nelida Velázquez. All rights reserved.
//

import UIKit
import CoreImage

class ViewController: UIViewController {

    @IBOutlet var imageView : UIImageView!
    @IBOutlet var faceView : UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let ciImage  = CIImage(CGImage:imageView.image!.CGImage!)
        let ciDetector = CIDetector(ofType:CIDetectorTypeFace
            ,context:nil
            ,options:[CIDetectorAccuracy:CIDetectorAccuracyHigh]
        )
        let features = ciDetector.featuresInImage(ciImage)
        
        UIGraphicsBeginImageContext(imageView.image!.size)
        imageView.image!.drawInRect(CGRectMake(0,0,imageView.image!.size.width,imageView.image!.size.height))
        
        for feature in features{
            let face = feature as! CIFaceFeature
            
            //context
            let drawCtxt = UIGraphicsGetCurrentContext()
            
            //face
            var faceRect = (feature as! CIFaceFeature).bounds
            faceRect.origin.y = imageView.image!.size.height - faceRect.origin.y - faceRect.size.height - 60.0
            faceRect.size.height = faceRect.size.height + 60.0
            let faceWidht = faceRect.size.height
            
            faceView.image = croppIngimage(imageView.image!, toRect: faceRect)
            
            if face.hasLeftEyePosition && face.hasRightEyePosition {
                let middle = (face.leftEyePosition.x + face.rightEyePosition.x) / 2
                
                faceRect.origin.x = middle - faceWidht/2
                faceRect.size.width = faceWidht
            }
            
            
            CGContextSetStrokeColorWithColor(drawCtxt, UIColor.redColor().CGColor)
            CGContextStrokeRect(drawCtxt,faceRect)
            
            print(faceRect)
            
        }
        let drawedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        imageView.image = drawedImage
        
        
    }
    
    func croppIngimage(imageToCrop:UIImage, toRect rect:CGRect) -> UIImage{
        
        let imageRef:CGImageRef = CGImageCreateWithImageInRect(imageToCrop.CGImage, rect)!
        let cropped:UIImage = UIImage(CGImage:imageRef)
        return cropped
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

