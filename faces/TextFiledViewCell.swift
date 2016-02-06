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
    
    var type: FaceTextFieldType? {
        
        willSet(incomingType) {
            guard let placeHolder = incomingType?.placeholder() else {
                return
            }
            self.textField.placeholder = placeHolder
        }
    }
    
}
