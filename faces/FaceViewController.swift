//
//  FaceViewController.swift
//  faces
//
//  Created by Nelida Velázquez on 10/26/15.
//  Copyright © 2015 Nelida Velázquez. All rights reserved.
//

import UIKit

class FaceViewController: UIViewController {

    @IBOutlet var doneButton: UIBarButtonItem!
    
    @IBAction func cancel(sender: UIButton){
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
