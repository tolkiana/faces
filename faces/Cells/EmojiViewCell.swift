//
//  EmojiViewCell.swift
//  faces
//
//  Created by Nelida Velazquez on 2/14/16.
//  Copyright © 2016 Nelida Velázquez. All rights reserved.
//

import UIKit

class EmojiViewCell: UICollectionViewCell {
    
    @IBOutlet private var emojiLabel: UILabel!
    
    var emoji: String? {
        
        willSet(incomingString) {
            guard let emojiString = incomingString else {
                return
            }
            self.emojiLabel.text = emojiString
        }
    }
}
