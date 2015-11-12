//
//  FaceViewController.swift
//  faces
//
//  Created by Nelida Velázquez on 10/26/15.
//  Copyright © 2015 Nelida Velázquez. All rights reserved.
//

import UIKit

class FaceViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet var doneButton: UIBarButtonItem!
    @IBOutlet var emojiPickerView: UIPickerView!
    
    var emojies: [String] = ["😀","😁","😃","😄","😊","😉","😍","😘","😙","😚","☺️",
    "😇","😋","😗","😛","😜","😝","😺","😻","😽"]

    // MARK: IBActions
    
    @IBAction func cancel(sender: UIButton){
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func selectFace(sender: UIButton?) {
        
    }
    
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
