//
//  UtilColor.swift
//  TapARideApp
//
//  Created by MAC0008 on 24/09/18.
//  Copyright © 2018 MAC0008. All rights reserved.
//

import UIKit


class UtilColor: NSObject
{
    func getBlackColor() -> UIColor
    {
        return UIColor.black
    }
    
    func getWhiteColor() -> UIColor
    {
        return UIColor.white
    }
    
    func getBoarderGrayColor() -> UIColor
    {
        return UIColor(red: 118 / 255.0, green: 117 / 255.0, blue: 117 / 255.0, alpha: 1.0)
    }
    
    func getBlackTrasparntAlert() -> UIColor
    {
        return UIColor(red: 0 / 255.0, green: 0 / 255.0, blue: 0 / 255.0, alpha: 0.7)
    }
    
    func getNavigationBarColor() -> UIColor
    {
        return UIColor(red: 0 / 255.0, green: 124 / 255.0, blue: 194 / 255.0, alpha: 1.0)
    }
    
    func getStatusBarColor() -> UIColor
    {
        return UIColor(red: 0 / 255.0, green: 124 / 255.0, blue: 194 / 255.0, alpha: 1.0)
    }
}

