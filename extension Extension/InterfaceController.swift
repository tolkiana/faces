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
        let currentImage : UIImage = applicationContext[kMyCurrentFace] as! UIImage
        saveImage(currentImage)
        loadCurrentFace()
    }
    
    func session(session: WCSession, didReceiveFile file: WCSessionFile) {
        print("Received File with URL: \(file.fileURL)")
        if let data = NSData(contentsOfURL: file.fileURL) {
            if let img = UIImage(data: data) {
                saveImage(img)
                loadCurrentFace()
            }
        }
    }
    
    func session(session: WCSession, didFinishFileTransfer fileTransfer: WCSessionFileTransfer, error: NSError?) {
        print("an error has occurred")
    }
    
    func saveImage(image : UIImage){
        let imageData = NSData(data: UIImagePNGRepresentation(image)!)
        let paths = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)
        let docs: String = paths[0]
        let fullPath = (docs as NSString).stringByAppendingPathComponent(kMyCurrentFace)
        imageData.writeToFile(fullPath, atomically: true)
    }


}
