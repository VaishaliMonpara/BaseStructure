//
//  UIViewController+Alert.swift
//  BaseStructure
//
//  Created by MAC0008 on 10/01/20.
//  Copyright © 2020 MAC0008. All rights reserved.
//

import Foundation

extension UIViewController {
    
    func showAlertController(withTitle title: String, message: String, completion: (() -> Void)?) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "Ok", style: .default) { action in
            completion?()
        }
        alertController.addAction(OKAction)
        present(alertController, animated: true, completion: nil)
    }
    
}
