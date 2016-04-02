//
//  FaceViewDelegate.swift
//  faces
//
//  Created by Nelida Velazquez on 3/20/16.
//  Copyright © 2016 Nelida Velázquez. All rights reserved.
//

import UIKit

extension FaceViewController: UITableViewDelegate {
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        switch indexPath.section {
        case TableSection.Image.rawValue:
            return Constants.Storyboard.ImageCellHeight
        default:
            return Constants.Storyboard.TextFiledCellHeight
        }
    }
}