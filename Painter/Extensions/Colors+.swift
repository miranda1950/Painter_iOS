//
//  Colors+.swift
//  Painter
//
//  Created by COBE on 11.04.2023..
//

import Foundation
import UIKit

extension UIColor {
    static let primary = rgb(255, 203, 0)
    
}


private extension UIColor {
    static func rgb(_ red: CGFloat, _ green: CGFloat, _ blue: CGFloat, _ alpha: CGFloat = 1.0) -> UIColor {
        return UIColor(red: red / 255.0, green: green / 255.0, blue: blue / 255.0, alpha: alpha)
    }
}
