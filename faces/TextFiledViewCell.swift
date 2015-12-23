//
//  TextFiledViewCell.swift
//  faces
//
//  Created by Nelida Velazquez on 12/22/15.
//  Copyright © 2015 Nelida Velázquez. All rights reserved.
//

import UIKit

class TextFiledViewCell: UITableViewCell {
    
    @IBOutlet private var textField: UITextField!
    
    var placeholder : String? {
        get {
            return self.textField.placeholder
        }
        
        set(newPlaceholder) {
            self.textField.placeholder = newPlaceholder
        }
    }
}
