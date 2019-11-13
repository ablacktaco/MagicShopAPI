//
//  RegisterView.swift
//  MagicStoreMix
//
//  Created by 陳姿穎 on 2019/11/13.
//  Copyright © 2019 Jes Yang. All rights reserved.
//

import UIKit

class RegisterView: UIView {
    
    let userPersist = UserPersist.shared
    
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var accountTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var emailTextField: UITextField!
    
    @IBAction func tapToRegister(_ sender: UIButton) {
        toUploadData()
    }
}

extension RegisterView {
    
    fileprivate func toUploadData() {
        let registerData = Register(name: nameTextField.text!, account: accountTextField.text!, password: passwordTextField.text!, email: emailTextField.text!)
        guard let uploadData = try? JSONEncoder().encode(registerData) else { return }
        
        let url = URL(string: "https://f5234a33.ngrok.io/api/register")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let task = URLSession.shared.uploadTask(with: request, from: uploadData) { (data, response, error) in
            if let error = error {
                print ("error: \(error)")
                return
            }
            if let response = response as? HTTPURLResponse {
                print("status code: \(response.statusCode)")
//                (200...299).contains(response.statusCode) else {
//                print ("server error")
//                return
                if let mimeType = response.mimeType,
                    mimeType == "application/json",
                    let data = data,
                    let dataString = String(data: data, encoding: .utf8) {
                    print ("got data: \(dataString)")
                }
            }
            
        }
        task.resume()
        
    }
    
}
