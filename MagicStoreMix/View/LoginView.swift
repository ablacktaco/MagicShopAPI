//
//  LoginView.swift
//  MagicStoreMix
//
//  Created by 陳姿穎 on 2019/11/13.
//  Copyright © 2019 Jes Yang. All rights reserved.
//

import UIKit

class LoginView: UIView {

    private weak var vc: LoginViewController?
    let userPersist = UserPersist.shared
    
    @IBOutlet var accountTextField: UITextField! {
        didSet { accountTextField.delegate = self }
    }
    @IBOutlet var passwordTextField: UITextField! {
        didSet { passwordTextField.delegate = self }
    }
    @IBOutlet var loginButton: UIButton!
    
    @IBAction func tapToLogin(_ sender: UIButton) {
        disableButton(sender)
        toUploadData()
        
    }
    @IBAction func tapToPassRegister(_ sender: UIButton) {
        if let registerVC = vc?.storyboard?.instantiateViewController(withIdentifier: "registerVC") as? RegisterViewController {
            vc?.navigationController?.pushViewController(registerVC, animated: true)
        }
    }
    
}

extension LoginView {
    
    func perpare(vc: LoginViewController) { self.vc = vc }
    
    func enableButton() {
        loginButton.isEnabled = true
        loginButton.backgroundColor = .black
    }
    
    func disableButton(_ sender: UIButton) {
        sender.isEnabled = false
        sender.backgroundColor = .lightGray
    }
    
    func toUploadData() {
//        let loginData = Login(account: accountTextField.text!, password: passwordTextField.text!)
        let loginData = Login(account: "ablacktaco", password: "1234567890")
        guard let uploadData = try? JSONEncoder().encode(loginData) else { return }
        
        let url = URL(string: "https://f5234a33.ngrok.io/api/login")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let task = URLSession.shared.uploadTask(with: request, from: uploadData) { (data, response, error) in
            if let error = error {
                print ("error: \(error)")
            }
            guard let response = response as? HTTPURLResponse,
                (200...299).contains(response.statusCode) else {
                print ("server error")
                return
            }
            if let mimeType = response.mimeType,
                mimeType == "application/json",
                let data = data,
                let dataString = String(data: data, encoding: .utf8) {
                print ("got data: \(dataString)")
                self.decodeData(data)
                DispatchQueue.main.async {
                    self.presentUserPage()
                }
            }
        }
        task.resume()
        
    }
    
    func decodeData(_ data: Data) {
//        let data1 = #"""
//   {"message":"\u55e8\uff0c\u597d\u4e45\u4e0d\u898b\uff1aA\u9ed1Taco\uff0c\u60a8\u7684\u8cc7\u6599\u5982\u4e0b\uff1a","data":{"id":11,"name":"A\u9ed1Taco","account":"ablacktaco","email":"ablacktaco@gmail.com","balance":2000,"email_verified_at":null,"role":0,"api_token":"bo1Tef9VR4ndrx8","created_at":"2019-11-12 03:21:39","updated_at":"2019-11-12 03:21:39"}}
//        """#.data(using: .utf8)!
        if let decodedData = try? JSONDecoder().decode(User.self, from: data) {
            userPersist.userData = decodedData.data
            print(userPersist.userData!)
        }
    }
    
    func presentUserPage() {
        if userPersist.userData != nil {
            if let UserNavigation = vc?.storyboard?.instantiateViewController(withIdentifier: "passToUserNavi") as? UINavigationController {
                vc?.present(UserNavigation, animated: false, completion: nil)
            }
        }
    }
    
}

extension LoginView: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
