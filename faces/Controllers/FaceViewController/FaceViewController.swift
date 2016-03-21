//
//  FaceViewController.swift
//  faces
//
//  Created by Nelida Velázquez on 10/26/15.
//  Copyright © 2015 Nelida Velázquez. All rights reserved.
//

import UIKit

enum TableSection: Int  {
    case Image, Info
}

class FaceViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate {

    // Oulets
    @IBOutlet var doneButton: UIBarButtonItem!
    @IBOutlet var tableView: UITableView!
    @IBOutlet var emojiView: UIView!
    @IBOutlet var emojiVisibleHeight: NSLayoutConstraint!

    // Variables
    private var activeTextField: UITextField?
    private var originalContentInset: UIEdgeInsets?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSNotificationCenter.defaultCenter().addObserver(self,
            selector: Selector("keyboardWillShow:"),
            name: UIKeyboardWillShowNotification,
            object: nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self,
            selector: Selector("keyboardWillHide:"),
            name: UIKeyboardWillHideNotification,
            object: nil)
    }
    
    // MARK: IBActions
    
    @IBAction func cancel(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func selectFace(sender: UIButton?) {
        
    }
    
    @IBAction func done(sender: UIButton) {
    
    }
    
    // MARK: UITableViewDataSource
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case TableSection.Image.rawValue:
            return 1
        default:
            return 3
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case TableSection.Image.rawValue:
            return tableView.dequeueReusableCellWithIdentifier(Constants.Storyboard.ImageCellIdentifier)!
        default:
            return textFieldCell(tableView, row: indexPath.row)
        }
    }
    
    func textFieldCell(tableView: UITableView, row: Int) -> TextFiledViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(Constants.Storyboard.TextFiledCellIdentifier) as! TextFiledViewCell
        cell.type = FaceTextFieldType(rawValue: row)
        return cell
    }
    
    // MARK: UITableViewDelegate
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        switch indexPath.section {
        case TableSection.Image.rawValue:
            return Constants.Storyboard.ImageCellHeight
        default:
            return Constants.Storyboard.TextFiledCellHeight
        }
    }
    
    // MARK: UITextFieldDelegate
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        self.activeTextField = textField
        
        guard let cell = textField.superview?.superview as? TextFiledViewCell,
            let textFieldType = cell.type else {
            return
        }
        
        switch textFieldType {
        case .Emoji:
            textField.resignFirstResponder()
            slideEmojiViewUp()
        case .Contact:
            print("Show Contancts")
        default:
            print("Do nothing")
        }
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        self.activeTextField = textField
    }
    
    func slideEmojiViewUp() {
        UIView.animateWithDuration(2.0) { () -> Void in
            self.emojiVisibleHeight.constant = 280
        }
    }
    
    // MARK: Keyboard notifications
    
    func keyboardWillShow(notification: NSNotification) {
    
        guard let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.CGRectValue(), let cell = self.activeTextField?.superview?.superview as? TextFiledViewCell  else {
            return
        }
        
        originalContentInset = tableView.contentInset
        tableView.contentInset = UIEdgeInsetsMake(0.0, 0.0, keyboardSize.height, 0.0)
        tableView.scrollToRowAtIndexPath(tableView.indexPathForCell(cell)!,
            atScrollPosition: UITableViewScrollPosition.Top,
            animated: true)
    }
    
    func keyboardWillHide(notification: NSNotification) {
        
        guard let contentInset = originalContentInset else {
            return
        }
        
        tableView.contentInset = contentInset
    }
}
