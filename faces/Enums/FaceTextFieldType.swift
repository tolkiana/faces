//
//  FaceTextFieldType.swift
//  faces
//
//  Created by Nelida Velazquez on 12/22/15.
//  Copyright © 2015 Nelida Velázquez. All rights reserved.
//

import Foundation

enum FaceTextFieldType: Int  {
    case Alias, Contact, Emoji
    
    func placeholder() -> String {
        switch self{
        case .Alias: return "Alias"
        case .Contact: return "Select your Contanct"
        case .Emoji: return "Select an Emoji"
        }
    }
}