//
//  UIColorHexString.swift
//  TapARideApp
//
//  Created by MAC0008 on 24/09/18.
//  Copyright © 2018 MAC0008. All rights reserved.
//

import Foundation
import UIKit

extension UIColor
{
    convenience init(hex: String)
    {
        let scanner = Scanner(string: hex)
        scanner.scanLocation = 0

        var rgbValue: UInt64 = 0

        scanner.scanHexInt64(&rgbValue)

        let r = (rgbValue & 0xff0000) >> 16
        let g = (rgbValue & 0xff00) >> 8
        let b = rgbValue & 0xff

        self.init(
            red: CGFloat(r) / 0xff,
            green: CGFloat(g) / 0xff,
            blue: CGFloat(b) / 0xff, alpha: 1
        )
    }
}
