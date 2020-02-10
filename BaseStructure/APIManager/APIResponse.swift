//
//  APIResponse.swift
//  BaseStructure
//
//  Created by MAC0008 on 10/01/20.
//  Copyright © 2020 MAC0008. All rights reserved.
//

import Foundation

struct APIResponse<A: Decodable>: Decodable {
    var status_code: Int
    var message: String?
    var data: A?
}
