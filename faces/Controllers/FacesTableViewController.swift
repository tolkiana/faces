//
//  FacesTableViewController.swift
//  faces
//
//  Created by Nelida Velázquez on 10/12/15.
//  Copyright © 2015 Nelida Velázquez. All rights reserved.
//

import UIKit

class FacesTableViewController: UIViewController, UITableViewDataSource {

    static let mom = Contact(firstName: "Juana", lastName: "Sedan", phoneNumber: "123456789")
    static let sis = Contact(firstName: "Claudia", lastName: "Velazquez", phoneNumber: "2341563917")
    
    var faces: [Face] = [
        Face(alias: "Sister", emoticon: "😜", imageName: "name", lastEmojiDate: NSDate(), contact: sis),
        Face(alias: "Mom", emoticon: "😘", imageName: "name", lastEmojiDate: NSDate(), contact: mom)
    ]

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
}

