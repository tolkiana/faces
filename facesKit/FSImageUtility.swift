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
        return nil
    }
    
    func cropfaceImage(image: UIImage) -> UIImage? {
        return nil
    }
    
    // MARK: Private methods
    
    private func featuresInImage(image: UIImage) -> [CIFeature] {
        
        let ciImage = CIImage(CGImage: image.CGImage!)
        
        let detector = CIDetector(ofType: CIDetectorTypeFace,
            context: nil,
            options: [CIDetectorAccuracy: CIDetectorAccuracyHigh])
        
        return detector.featuresInImage(ciImage)
    }

}