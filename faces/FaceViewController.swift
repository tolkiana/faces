//
//  FaceViewController.swift
//  faces
//
//  Created by Nelida Velázquez on 10/26/15.
//  Copyright © 2015 Nelida Velázquez. All rights reserved.
//

import UIKit

class FaceViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate {

    @IBOutlet var doneButton: UIBarButtonItem!
    @IBOutlet var tableView: UITableView!
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
        return section == 0 ? 1 : 3
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCellWithIdentifier("ImageCellIdentifier")!
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCellWithIdentifier("TextFieldCellIdentifier") as! TextFiledViewCell
            cell.placeholder = FaceTextFieldType(rawValue: indexPath.row)?.placeholder()
            return cell
        }
    }
    
    // MARK: UITableViewDelegate
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return indexPath.section == 0 ? 240.0 : 43.0
    }
    
    // MARK: UITextFieldDelegate
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        self.activeTextField = textField
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        self.activeTextField = textField
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
