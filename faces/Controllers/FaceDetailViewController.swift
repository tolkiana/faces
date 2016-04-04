//
//  FaceDetailViewController.swift
//  faces
//
//  Created by Nelida Velazquez on 4/3/16.
//  Copyright © 2016 Nelida Velázquez. All rights reserved.
//

import Foundation
import UIKit

class FaceDetailViewController: UIViewController {
    
    @IBOutlet var lastEmojiDate: UILabel!
    @IBOutlet var contactName: UILabel!
    @IBOutlet var emoji: UILabel!
    @IBOutlet var faceImageView: UIImageView!
    
    var face: Face?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let aface = face else {
            return
        }
        
        contactName.text = aface.contact.firstName + " " + aface.contact.lastName
        emoji.text = aface.emoticon
        faceImageView.image = UIImage(named: aface.imageName)
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = NSDateFormatterStyle.ShortStyle
        
        lastEmojiDate.text = dateFormatter.stringFromDate(aface.lastEmojiDate)
    }
}