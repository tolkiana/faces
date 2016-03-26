//
//  EmojiPickerView.swift
//  faces
//
//  Created by Nelida Velazquez (IT - IS Ecomm O) on 11/11/15.
//  Copyright © 2015 Nelida Velázquez. All rights reserved.
//

import UIKit

class EmojiPickerViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet var pickerView: UIPickerView!
    
    var emojies: [String] = ["🙂","🙃","😀","😁","😃","😄","😊","😉","😍","😘","😙","😚","☺️",
        "😇","😋","😗","😛","😜","😝","😺","😸","😻","😽","❤️"]

    // MARK: UICollectionViewDataSource
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return emojies.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(Constants.Storyboard.EmojiCellIdentifier, forIndexPath: indexPath) as! EmojiViewCell
        cell.emoji = emojies[indexPath.row]
        return cell
    }
    
    // MARK: UICollectionViewDelegateFlowLayout
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSize(
            width: collectionView.frame.width/Constants.Storyboard.EmojiCellScaleFactor,
            height: collectionView.frame.width/Constants.Storyboard.EmojiCellScaleFactor)
    }    
}
