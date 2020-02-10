//
//  LoginViewController.swift
//  BaseStructure
//
//  Created by MAC0008 on 10/01/20.
//  Copyright © 2020 MAC0008. All rights reserved.
//

import UIKit
import Toast_Swift

class LoginViewController: BaseViewController {

    fileprivate let loginViewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.attemptLogin()
        
    }
  
    fileprivate func attemptLogin()
    {
        self.loading_view?.showProgress(self.view)
        let reqLogin = ReqLogin(username: "7978979797", password: "abc123")
        loginViewModel.login(with: reqLogin, completon: {
            state in
            self.loading_view?.removeProgress()
            switch state{
            case .success: self.showLoginSuccessAlert()
            case .failure: self.showLoginErrorAlert()
            }
        })
    }
    
    fileprivate func showLoginSuccessAlert() {
        showAlertController(withTitle: "Success", message: loginViewModel.loginData!.message!, completion: nil)
    }
    
    fileprivate func showLoginErrorAlert() {
        showAlertController(withTitle: "Error", message: loginViewModel.loginData!.message!, completion: nil)
    }

}
