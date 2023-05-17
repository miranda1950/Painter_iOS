//
//  UITextField+.swift
//  Painter
//
//  Created by COBE on 12.05.2023..
//

import UIKit

extension UITextField {
    func isValid(with word: String) -> Bool {
        if word.count < 5 {
            return false
        } else {
            return true
        }
    }
}
