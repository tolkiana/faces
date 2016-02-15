//
//  FacesTableViewController.swift
//  faces
//
//  Created by Nelida Velázquez on 10/12/15.
//  Copyright © 2015 Nelida Velázquez. All rights reserved.
//

import UIKit

class FacesTableViewController: UIViewController, UITableViewDataSource {

    var faces: [Face] = [
        Face(title: "Matías", emoticon: "😀", imageName: "name"),
        Face(title: "Mamá", emoticon: "😁", imageName: "name"),
    ]

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return faces.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("FaceCellIdentifier") as! FaceTableViewCell
        
        cell.faceTitleLabel.text = faces[indexPath.row].title
        cell.emoticonLabel.text = faces[indexPath.row].emoticon
        cell.imageView?.image = UIImage(named: faces[indexPath.row].imageName)
        
        return cell
    }
}

