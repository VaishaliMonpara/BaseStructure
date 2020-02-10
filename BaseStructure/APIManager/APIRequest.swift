//
//  APIRequest.swift
//  BaseStructure
//
//  Created by MAC0008 on 10/01/20.
//  Copyright © 2020 MAC0008. All rights reserved.
//

import Foundation
import Moya

enum MyService{
    case loginUser(request: ReqLogin)
}

let provider = MoyaProvider<MyService>(plugins: [NetworkLoggerPlugin(verbose: true)])


extension MyService: TargetType
{
    var envirementBaseURL : String
    {
        switch APIManager.environment {
        case .developement: return "http://api.orataro.com/api/Transportation/"
        case .production: return "http://api.orataro.com/api/Transportation/"
        case .qa: return "http://api.orataro.com/api/Transportation/"
        }
    }
    
    
    var baseURL: URL {
        guard let url = URL(string: envirementBaseURL) else {
            fatalError("baseURL could not be configured")
        }
        
        return url
    }
    
    var path: String {
        switch self {
        case .loginUser( _):
            return "DriverLogin"
        }
    }
    
    var method: Moya.Method {
        return .post
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {

        switch self {
        case .loginUser(let reqParam):
            return .requestParameters(parameters: ["username": reqParam.username, "password": reqParam.password], encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        return ["Content-Type":"application/x-www-form-urlencoded"]
    }
    
}


