//
//  RequestLogin.swift
//  BaseStructure
//
//  Created by MAC0008 on 10/01/20.
//  Copyright © 2020 MAC0008. All rights reserved.
//

import Foundation
import Moya

struct LoginService {
    func reqLogin(with request: ReqLogin, completion: @escaping (Result<ResLogin,APIError>)-> Void)
    {
        provider.request(.loginUser(request: request), completion: {
            (result) in
            switch result
            {
            case .success(let response):
                do{
                    let decoded = try response.map(ResLogin.self)
                    completion(.success(decoded))
                }
                catch
                {
                    print(error)
                    print(error.localizedDescription)
                    completion(.failure(.generic(message: "can not parse")))
                }
            case .failure(let error):
                completion(.failure(.generic(message: error.localizedDescription)))
            }
        })
    }
}
