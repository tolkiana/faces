//
//  FacesTableViewController.swift
//  faces
//
//  Created by Nelida Velázquez on 10/12/15.
//  Copyright © 2015 Nelida Velázquez. All rights reserved.
//

import UIKit

class FacesTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    static let mom = Contact(firstName: "Juana", lastName: "Sedan", phoneNumber: "123456789")
    static let sis = Contact(firstName: "Claudia", lastName: "Velazquez", phoneNumber: "2341563917")
    
    var faces: [Face] = [
        Face(alias: "Sister", emoticon: "😜", imageName: "Sis", lastEmojiDate: NSDate(), contact: sis),
        Face(alias: "Mom", emoticon: "😘", imageName: "Mom", lastEmojiDate: NSDate(), contact: mom)
    ]

    private var selectedFace: Face?
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return faces.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("FaceCellIdentifier") as! FaceTableViewCell
        
        cell.faceTitleLabel.text = faces[indexPath.row].alias
        cell.emoticonLabel.text = faces[indexPath.row].emoticon
        cell.imageView?.image = UIImage(named: faces[indexPath.row].imageName)
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        selectedFace = faces[indexPath.row]
        self.performSegueWithIdentifier(Constants.Storyboard.FaceDetailIdentifier, sender: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        guard let identifier = segue.identifier, let selectedFace = selectedFace else {
            return
        }
        if (identifier == Constants.Storyboard.FaceDetailIdentifier) {
            let detail: FaceDetailViewController = segue.destinationViewController as! FaceDetailViewController
            detail.viewModel = FaceViewModelFromFace(face: selectedFace)
        }
    }
}

