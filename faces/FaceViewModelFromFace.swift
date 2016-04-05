//
//  FaceViewModelFromFace.swift
//  faces
//
//  Created by Nelida Velazquez on 4/4/16.
//  Copyright © 2016 Nelida Velázquez. All rights reserved.
//

import Foundation
import UIKit

class FaceViewModelFromFace: FaceViewModel {
    
    let date: String
    let alias: String
    let contactName: String
    var image: UIImage?
    let emoji: String
    
    init(face: Face) {
        
        self.alias = face.alias
        self.contactName = face.contact.firstName + " " + face.contact.lastName
        self.emoji = face.emoticon
        self.image = UIImage(named: face.imageName)
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = NSDateFormatterStyle.ShortStyle
        
        self.date = dateFormatter.stringFromDate(face.lastEmojiDate)
        
        guard let image = UIImage(named: face.imageName) else {
            return
        }
        self.image = FSImageUtility().maskRoundedImage(image)
    }
}