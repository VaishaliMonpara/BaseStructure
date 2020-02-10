//
//  Util_URLGenerator.swift
//  TapARideApp
//
//  Created by MAC0008 on 24/09/18.
//  Copyright © 2018 MAC0008. All rights reserved.
//

import UIKit


//MARK:- Development Link
let BaseUrl = "http://irichapidev.softcube.in/api/v2/"
let BusinessLogoUrl = "http://irichdev.softcube.in/UploadImages/businessLogo/"
let CategoryUrl = "http://irichdev.softcube.in/UploadImages/GeneralSetup/"
let DealUrl = "http://irichdev.softcube.in/UploadImages/Deals/"
let ProfileImageUrl = "http://irichdev.softcube.in/UploadImages/UserProfile/"


class Util_URLGenerator: NSObject
{
    static func getRequestUrl(methodName:String) -> String 
    { 
        return (BaseUrl.appendingFormat(methodName))
    }
}
  
