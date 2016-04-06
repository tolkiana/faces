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
        
        guard let aface = face else {
            return
        }
        title = aface.alias
        contactName.text = aface.contact.firstName + " " + aface.contact.lastName
        emoji.text = aface.emoticon
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = NSDateFormatterStyle.MediumStyle
        lastEmojiDate.text = dateFormatter.stringFromDate(aface.lastEmojiDate)
        
        guard let image = UIImage(named: aface.imageName) else {
            return
        }
        faceImageView.image = maskRoundedImage(image)
    }
    
    func maskRoundedImage(image: UIImage) -> UIImage? {
        let square = CGSize(width: min(image.size.width, image.size.height), height: min(image.size.width, image.size.height))
        let imageView = UIImageView(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: square))
        imageView.contentMode = .ScaleAspectFill
        imageView.image = image
        imageView.layer.cornerRadius = square.width/2
        imageView.layer.masksToBounds = true
        UIGraphicsBeginImageContext(imageView.bounds.size)
        guard let context = UIGraphicsGetCurrentContext() else { return nil }
        imageView.layer.renderInContext(context)
        let result = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return result
    }
}