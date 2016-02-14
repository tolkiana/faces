//
//  EmojiPickerView.swift
//  faces
//
//  Created by Nelida Velazquez (IT - IS Ecomm O) on 11/11/15.
//  Copyright © 2015 Nelida Velázquez. All rights reserved.
//

import UIKit

class EmojiPickerViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet var pickerView: UIPickerView!
    
    var emojies: [String] = ["😀","😁","😃","😄","😊","😉","😍","😘","😙","😚","☺️",
        "😇","😋","😗","😛","😜","😝","😺","😻","😽"]

    // MARK: UIPickerViewDataSoruce
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return emojies.count
    }
    
    // MARK: UIPickerViewDelegate
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return emojies[row]
    }
    
    func pickerView(pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 40.0
    }
}
