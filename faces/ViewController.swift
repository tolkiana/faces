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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let ciImage  = CIImage(CGImage:imageView.image!.CGImage!)
        let ciDetector = CIDetector(ofType:CIDetectorTypeFace
            ,context:nil
            ,options:[
                CIDetectorAccuracy:CIDetectorAccuracyHigh,
                CIDetectorSmile:true
            ]
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
            faceRect.origin.y = imageView.image!.size.height - faceRect.origin.y - faceRect.size.height
            CGContextSetStrokeColorWithColor(drawCtxt, UIColor.redColor().CGColor)
            CGContextStrokeRect(drawCtxt,faceRect)
            
            //mouse
            if(face.hasMouthPosition){
                let mouseRectY = imageView.image!.size.height - face.mouthPosition.y
                let mouseRect  = CGRectMake(face.mouthPosition.x - 5,mouseRectY - 5,10,10)
                CGContextSetStrokeColorWithColor(drawCtxt,UIColor.blueColor().CGColor)
                CGContextStrokeRect(drawCtxt,mouseRect)
            }
            
            //hige
            let higeImg      = UIImage(named:"IMG_4864.jpg")
            let mouseRectY = imageView.image!.size.height - face.mouthPosition.y
            //ヒゲの横幅は顔の4/5程度
            let higeWidth  = faceRect.size.width * 4/5
            let higeHeight = higeWidth * 0.3 // 元画像が100:30なのでWidthの30%が縦幅
            let higeRect  = CGRectMake(face.mouthPosition.x - higeWidth/2,mouseRectY - higeHeight/2,higeWidth,higeHeight)
            CGContextDrawImage(drawCtxt,higeRect,higeImg!.CGImage)
            
            //leftEye
            if(face.hasLeftEyePosition){
                let leftEyeRectY = imageView.image!.size.height - face.leftEyePosition.y
                let leftEyeRect  = CGRectMake(face.leftEyePosition.x - 5,leftEyeRectY - 5,10,10)
                CGContextSetStrokeColorWithColor(drawCtxt, UIColor.blueColor().CGColor)
                CGContextStrokeRect(drawCtxt,leftEyeRect)
            }
            
            //rightEye
            if(face.hasRightEyePosition){
                let rightEyeRectY = imageView.image!.size.height - face.rightEyePosition.y
                let rightEyeRect  = CGRectMake(face.rightEyePosition.x - 5,rightEyeRectY - 5,10,10)
                CGContextSetStrokeColorWithColor(drawCtxt, UIColor.blueColor().CGColor)
                CGContextStrokeRect(drawCtxt,rightEyeRect)
            }
        }
        let drawedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        imageView.image = drawedImage
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

