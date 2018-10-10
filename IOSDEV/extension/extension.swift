//
//  extension.swift
//  IOSDEV
//
//  Created by sinbad on 10/9/18.
//  Copyright © 2018 sinbad. All rights reserved.
//

import UIKit
extension UIColor {
    // rgb color formate
    convenience init(red: Int, green: Int, blue: Int){
        self.init(red: CGFloat(red)/255.0, green: CGFloat(green)/255.0, blue: CGFloat(blue)/255.0, alpha: 1.0)
    }
    
    //hex color formate
    convenience init(rgb: Int){
        self.init(
            red: (rgb >> 16 ) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
}
