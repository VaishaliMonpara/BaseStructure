//
//  MyuserDefault.swift
//  BaseStructure
//
//  Created by MAC0008 on 20/09/19.
//  Copyright © 2019 MAC0008. All rights reserved.
//

import Foundation

let IsUserLogin = "IsUserLogin"

@objc class MyUserDefault: NSObject
{
    // MARK: Set UserDefault
    static func SetUserLogin(IsLogin : String)
    {
        let userDefault : UserDefaults  =  UserDefaults.standard
        
        userDefault.setValue(IsLogin, forKey: IsUserLogin)
        
        userDefault.synchronize()
    }
   
    // MARK: Get UserDefault
    static func getIsUserLogin() -> String
    {
        let userDefault : UserDefaults  =  UserDefaults.standard
        if userDefault.value(forKey: IsUserLogin) != nil
        {
            return userDefault.value(forKey: IsUserLogin) as! String
        }
        else
        {
            return ""
        }
    }

    // MARK: Remove UserDetail
    static func removeUserDetail()
    {
        let userDefault : UserDefaults  =  UserDefaults.standard
        userDefault.removeObject(forKey: IsUserLogin)
    }
    
}

