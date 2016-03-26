//
//  FaceViewDataSource.swift
//  faces
//
//  Created by Nelida Velazquez on 3/20/16.
//  Copyright © 2016 Nelida Velázquez. All rights reserved.
//

import Foundation
import UIKit

class FaceViewDataSource: NSObject, UITableViewDataSource {
    
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
    
    // MARK: Private function
    
    private func textFieldCell(tableView: UITableView, row: Int) -> TextFiledViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(Constants.Storyboard.TextFiledCellIdentifier) as! TextFiledViewCell
        cell.type = FaceTextFieldType(rawValue: row)
        return cell
    }
}