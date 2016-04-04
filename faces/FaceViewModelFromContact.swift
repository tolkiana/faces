//
//  FaceViewModelFromContact.swift
//  faces
//
//  Created by Nelida Velazquez on 4/4/16.
//  Copyright © 2016 Nelida Velázquez. All rights reserved.
//

import Foundation
import UIKit

class FaceViewModelFromContact: FaceViewModel {
    let date: String
    let alias: String
    let contactName: String
    let image: UIImage?
    let emoji: String
    
    init(contact: Contact) {
        
        self.alias = ""
        self.contactName = contact.firstName + " " + contact.lastName
        self.emoji = "😀"
        self.image = UIImage(named: Constants.Images.FacePlaceHolder)
        self.date = "Unknown"
    }
}