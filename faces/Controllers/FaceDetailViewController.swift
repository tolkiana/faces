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
    // New requirement, add a Contact property
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = face?.alias
        contactName.text = face?.contactName
        emoji.text = face?.emoticon
        lastEmojiDate.text = face?.formattedDate
        faceImageView.image = face?.image
    }
}