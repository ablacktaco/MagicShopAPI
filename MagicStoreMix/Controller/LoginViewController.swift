//
//  LoginViewController.swift
//  MagicStoreMix
//
//  Created by 陳姿穎 on 2019/11/13.
//  Copyright © 2019 Jes Yang. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    let userPersist = UserPersist.shared
    var loginView: LoginView { view as! LoginView }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if UserPersist.shared.userData != nil {
            if let UserNavigation = storyboard?.instantiateViewController(withIdentifier: "passToUserNavi") as? UINavigationController {
                present(UserNavigation, animated: false, completion: nil)
            }
        }
        
        loginView.perpare(vc: self)
        
        let backButton = UIBarButtonItem(title: "返回", style: .plain, target: self, action: nil)
        navigationItem.backBarButtonItem = backButton
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        loginView.enableButton()
    }

}

