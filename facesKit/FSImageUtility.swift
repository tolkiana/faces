//
//  FSImageUtility.swift
//  faces
//
//  Created by Nelida Velázquez on 10/12/15.
//  Copyright © 2015 Nelida Velázquez. All rights reserved.
//

import Foundation
import CoreImage

class FSImageUtility {

    func saveImage(image: UIImage, imageName: String) {
        let imageData = NSData(data: UIImageJPEGRepresentation(image, 1.0)!)
        let paths = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)
        let docs: String = paths[0]
        let fullPath = (docs as NSString).stringByAppendingPathComponent(imageName)
        imageData.writeToFile(fullPath, atomically: true)
    }
    
    func imageWithName(imageName: String) -> UIImage? {
        let documentDirectory = NSSearchPathDirectory.DocumentDirectory
        let userDomainMask = NSSearchPathDomainMask.UserDomainMask
        let paths = NSSearchPathForDirectoriesInDomains(documentDirectory, userDomainMask, true)
        
        if paths.count > 0 {
            if let dirPath: String = paths[0] {
                let readPath = (dirPath as NSString).stringByAppendingPathComponent(imageName)
                let image = UIImage(contentsOfFile: readPath)
                return image
            }
        }
        return nil
    }
    
    func imageContainsFace(image: UIImage) -> Bool {
        return featuresInImage(image).count > 0;
    }
    
    func facesImagesInImage(image: UIImage) -> [UIImage]? {

        var faces = [UIImage]()
        let margin: CGFloat = 60.0
        
        for feature in featuresInImage(image){
            let face = feature as! CIFaceFeature
            
            // Obtaining the rect where the face is adding some margin to the original rect
            var faceRect = face.bounds
            faceRect.origin.y = image.size.height - faceRect.origin.y - faceRect.size.height - margin
            faceRect.size.height = faceRect.size.height + margin
            let faceWidht = faceRect.size.height
            
            if face.hasLeftEyePosition && face.hasRightEyePosition {
                let middle = (face.leftEyePosition.x + face.rightEyePosition.x) / 2
                faceRect.origin.x = middle - faceWidht/2
                faceRect.size.width = faceWidht
            }
            
            faces.append(croppIngimage(image, toRect: faceRect))
        }
        
        return faces;
    }
    
    func maskRoundedImage(image: UIImage, radius: Float) -> UIImage {
        let imageView: UIImageView = UIImageView(image: image)
        var layer: CALayer = CALayer()
        layer = imageView.layer
        
        layer.masksToBounds = true
        layer.cornerRadius = CGFloat(radius)
        
        UIGraphicsBeginImageContext(imageView.bounds.size)
        layer.renderInContext(UIGraphicsGetCurrentContext()!)
        let roundedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return roundedImage
    }
    
    // MARK: Private methods
    
    private func featuresInImage(image: UIImage) -> [CIFeature] {
        
        let ciImage = CIImage(CGImage: image.CGImage!)
        
        let detector = CIDetector(ofType: CIDetectorTypeFace,
            context: nil,
            options: [CIDetectorAccuracy: CIDetectorAccuracyHigh])
        
        return detector.featuresInImage(ciImage)
    }
    
    private func croppIngimage(imageToCrop:UIImage, toRect rect:CGRect) -> UIImage{
        
        let imageRef:CGImageRef = CGImageCreateWithImageInRect(imageToCrop.CGImage, rect)!
        let cropped:UIImage = UIImage(CGImage:imageRef)
        return cropped
    }

}