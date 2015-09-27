//
//  ViewController.swift
//  faces
//
//  Created by Nelida Velázquez on 5/28/15.
//  Copyright (c) 2015 Nelida Velázquez. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView:UIImageView!
    
    let imagePicker = UIImagePickerController()
    let kMyCurrentFace = "myFace.png"

    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        loadCurrentFace()
    }
    
    // MARK: - IBActions
    
    @IBAction func selectFromPhotos(sender: UIButton){
        selectFaceFromPhotos()
    }
    
    @IBAction func selectFromCamera(sender: UIButton){
        captureFaceFromCamera()
    }
    
    // MARK: - Private functions
    
    func selectFaceFromPhotos(){
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .PhotoLibrary
        
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    func captureFaceFromCamera(){
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .Camera
        
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    func saveImage(image : UIImage){
        let imageData = NSData(data: UIImagePNGRepresentation(image)!)
        let paths = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)
        let docs: String = paths[0]
        let fullPath = (docs as NSString).stringByAppendingPathComponent(kMyCurrentFace)
        imageData.writeToFile(fullPath, atomically: true)
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
            imageView.contentMode = .ScaleAspectFit
            imageView.image = myFace
        }
    }
    
    // MARK: - UIImagePickerControllerDelegate
    
    func imagePickerController( picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            imageView.contentMode = .ScaleAspectFit
            imageView.image = pickedImage
            saveImage(pickedImage)
        }
        dismissViewControllerAnimated(true, completion: nil)
    }

}

