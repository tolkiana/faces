//
//  ViewController.swift
//  faces
//
//  Created by Nelida Velázquez on 5/28/15.
//  Copyright (c) 2015 Nelida Velázquez. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    let imagePicker = UIImagePickerController()

    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
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
    
    // MARK: - UIImagePickerControllerDelegate
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            print(pickedImage)
        }
        dismissViewControllerAnimated(true, completion: nil)
        
    }
}

