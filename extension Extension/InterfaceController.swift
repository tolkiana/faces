//
//  InterfaceController.swift
//  extension Extension
//
//  Created by Nelida Velázquez on 9/27/15.
//  Copyright © 2015 Nelida Velázquez. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity

class InterfaceController: WKInterfaceController,WCSessionDelegate {

    @IBOutlet weak var myFaceImage: WKInterfaceImage!
    @IBOutlet weak var myFaceName: WKInterfaceLabel!
    
    let kMyCurrentFace = "myFace.png"
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        WCSession.defaultSession().delegate = self
        WCSession.defaultSession().activateSession()
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        loadCurrentFace()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    func imageWithName(imageName: String) -> UIImage? {
        
        let documentDirectory = NSSearchPathDirectory.DocumentDirectory
        let userDomainMask = NSSearchPathDomainMask.UserDomainMask
        let paths = NSSearchPathForDirectoriesInDomains(documentDirectory, userDomainMask, true)
        
        if paths.count > 0 {
            if let dirPath : String = paths[0] {
                let readPath = (dirPath as NSString).stringByAppendingPathComponent(imageName)
                let image = UIImage(contentsOfFile: readPath)
                return image
            }
        }
        return nil
    }
    
    func loadCurrentFace() {
        
        if let myFace = imageWithName(kMyCurrentFace) {
            myFaceImage.setImage(myFace)
        }
    }
    
    // MARK: - SessionDelegate
    
    func session(session: WCSession, didReceiveApplicationContext applicationContext: [String : AnyObject]) {
        
        if let currentImageData: NSData = applicationContext[kMyCurrentFace] as? NSData{
            if let image: UIImage = UIImage(data: currentImageData){
                myFaceImage.setImage(image)
            }
            saveImage(currentImageData)
        }
    }
    
    func saveImage(imageData : NSData){
        let paths = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)
        let docs: String = paths[0]
        let fullPath = (docs as NSString).stringByAppendingPathComponent(kMyCurrentFace)
        imageData.writeToFile(fullPath, atomically: true)
    }


}
