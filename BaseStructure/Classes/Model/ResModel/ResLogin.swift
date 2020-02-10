//
//  ResLogin.swift
//  BaseStructure
//
//  Created by MAC0008 on 10/01/20.
//  Copyright © 2020 MAC0008. All rights reserved.
//

import Foundation

struct ResLogin: Decodable {
    var status_code: Int
    var message: String?
    var data: LoginData?
}

struct LoginData: Decodable {
    let accesstoken: String
    let username: String
}
