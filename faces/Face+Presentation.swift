//
//  Face+Presentation.swift
//  faces
//
//  Created by Nelida Velazquez on 4/9/16.
//  Copyright © 2016 Nelida Velázquez. All rights reserved.
//

import Foundation
import UIKit

extension Face {

    var contactName: String {
        return self.contact.firstName + " " + self.contact.lastName
    }
    
    var formattedDate: String {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = NSDateFormatterStyle.MediumStyle
        return dateFormatter.stringFromDate(self.lastEmojiDate)
    }
    
    var image: UIImage? {
        guard let image = UIImage(named: self.imageName) else {
            return nil
        }
        return FSImageUtility().maskRoundedImage(image)
    }
}