//
//  FaceViewController.swift
//  faces
//
//  Created by Nelida Velázquez on 10/26/15.
//  Copyright © 2015 Nelida Velázquez. All rights reserved.
//

import UIKit

class FaceViewController: UIViewController, UITableViewDataSource {

    @IBOutlet var doneButton: UIBarButtonItem!
    @IBOutlet var tableView: UITableView!

    // MARK: IBActions
    
    @IBAction func cancel(sender: UIButton){
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func selectFace(sender: UIButton?) {
        
    }
    
    // MARK: UITableViewDataSource
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("TextFieldCellIdentifier") as! TextFiledViewCell
        cell.placeholder = FaceTextFieldType(rawValue: indexPath.row)?.placeholder()
        
        return cell
    }
    
}
