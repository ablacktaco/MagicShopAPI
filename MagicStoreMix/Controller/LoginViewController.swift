//
//  LoginViewController.swift
//  MagicStoreMix
//
//  Created by 陳姿穎 on 2019/11/13.
//  Copyright © 2019 Jes Yang. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    let magicBook = MagicBookList.shared
    let userPersist = UserPersist.shared
    var loginView: LoginView { view as! LoginView }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getMagicData()
        while magicBook.bookLists == nil {}

        if UserPersist.shared.userData != nil {
            if let UserNavigation = self.storyboard?.instantiateViewController(withIdentifier: "passToUserNavi") as? UINavigationController {
                self.present(UserNavigation, animated: false, completion: nil)
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

extension LoginViewController {
    
    func getMagicData() {
        let address = "https://35.221.143.0/api/items/all"
        if let url = URL(string: address) {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let error = error {
                    print("error: \(error.localizedDescription)")
                }
                guard let data = data else { return }
                if let response = response as? HTTPURLResponse {
                    print("status code: \(response.statusCode)")
                    if let magicData = try? JSONDecoder().decode(MagicBook.self, from: data) {
                        self.magicBook.bookLists = magicData.data
                    }
                }
            }.resume()
        }
    }
    
}
