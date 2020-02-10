//
//  LoginViewModel.swift
//  BaseStructure
//
//  Created by MAC0008 on 10/01/20.
//  Copyright © 2020 MAC0008. All rights reserved.
//

import Foundation

class LoginViewModel {
    
    fileprivate let service = LoginService()
    var loginData: ResLogin?
    
    func login(with request: ReqLogin, completon: @escaping ((ViewModelState) -> Void))
    {
        service.reqLogin(with: request, completion: {
            (result) in
            switch result{
            case .success(let response): print(response.data?.accesstoken ?? "")
            self.loginData = response
            completon(.success)
            case .failure(let error):
                print(error.localizedDescription)
                completon(.failure)
            }
        })
    }
    
}
