//
//  Fonts+.swift
//  Painter
//
//  Created by COBE on 11.04.2023..
//

import Foundation
import UIKit

extension UIFont {
    
    static let regularMyriad = Font.myriadCondensed
    static let lightMyriad = Font.myriadCondensedLight
    static let boldMyriad = Font.myriadCondensedBold
    
    static let test = Font.boldMyriad(size: 32)
    
    
    
    static func printFonts() {
        let fontFamilyNames = UIFont.familyNames
        for familyName in fontFamilyNames {
            print("------------------------------")
            print("Font Family Name = [\(familyName)]")
            let names = UIFont.fontNames(forFamilyName: familyName)
            print("Font Names = [\(names)]")
        }
    }
}

enum Font: String {
    
    case myriadCondensedLight = "MyriadPro-LightCond"
    case myriadCondensed = "MyriadPro-Cond"
    case myriadCondensedBold = "MyriadPro-BoldCond"
    
    var name: String {
        return self.rawValue
    }
    
    func size(_ size: CGFloat) -> UIFont {
        return UIFont(name: self.rawValue, size: size)!
    }
    
    static func regularMyriad(size: CGFloat) -> UIFont {
        return Font.myriadCondensed.size(size)
    }
    
    static func lightMyriad(size: CGFloat) -> UIFont {
        return Font.myriadCondensedLight.size(size)
    }
    
    static func boldMyriad(size: CGFloat) -> UIFont {
        return Font.myriadCondensedBold.size(size)
    }
    
}
