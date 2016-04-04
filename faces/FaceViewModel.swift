//
//  FaceViewModel.swift
//  faces
//
//  Created by Nelida Velazquez on 4/4/16.
//  Copyright © 2016 Nelida Velázquez. All rights reserved.
//

import Foundation
import UIKit

protocol FaceViewModel {
    var date: String { get }
    var alias: String { get }
    var contactName: String { get }
    var image: UIImage? { get }
    var emoji: String { get }
}