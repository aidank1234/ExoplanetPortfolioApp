//
//  Ext.UIColor.swift
//  PicksApp
//
//  Created by Aidan Kaiser on 1/6/21.
//  Copyright © 2021 Aidan Kaiser. All rights reserved.
//

import UIKit

extension UIColor {
    struct AppColors {
        static var clouds = UIColor(rgb: 0xecf0f1)
        static var darkGreen = UIColor(rgb: 0x27ae60)
        static var brickRed = UIColor(rgb: 0xcc3366)
        static var normalGreen = UIColor(rgb: 0x27ae60)
        static var babyBlue = UIColor(rgb: 0x77c3ec)
    }
    
   convenience init(red: Int, green: Int, blue: Int) {
       assert(red >= 0 && red <= 255, "Invalid red component")
       assert(green >= 0 && green <= 255, "Invalid green component")
       assert(blue >= 0 && blue <= 255, "Invalid blue component")

       self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
   }

   convenience init(rgb: Int) {
       self.init(
           red: (rgb >> 16) & 0xFF,
           green: (rgb >> 8) & 0xFF,
           blue: rgb & 0xFF
       )
   }
}
