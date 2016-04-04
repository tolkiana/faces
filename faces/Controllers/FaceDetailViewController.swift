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
    
    var viewModel: FaceViewModel? {
        didSet {
            lastEmojiDate.text = viewModel?.date
            contactName.text = viewModel?.contactName
            emoji.text = viewModel?.emoji
            faceImageView.image = viewModel?.image
            title = viewModel?.alias
        }
    }
}