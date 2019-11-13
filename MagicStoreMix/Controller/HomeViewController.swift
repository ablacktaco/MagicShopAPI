//
//  ViewController.swift
//  MagicStoreMix
//
//  Created by Jes Yang on 2019/11/6.
//  Copyright © 2019 Jes Yang. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    let userPersist = UserPersist.shared
    let correctAnswer = [true, true, false, true, true, false, false]
    
    var didInput = [Bool]() {
        didSet {
            if self.didInput.count == 8 {
                self.didInput.removeFirst()
                print(self.didInput)
            }
            if self.didInput == correctAnswer {
                userPersist.user.addMoney()
                moneyLabel.text = "$ \(userPersist.user.totalMoney)"
            }
        }
    }
    
    @IBOutlet weak var nameLabel: UILabel! {
        didSet {
            nameLabel.text = "\(userPersist.userData!.name)"
        }
    }
    @IBOutlet weak var moneyLabel: UILabel!
    
    @IBAction func tapToLogOut(_ sender: UIBarButtonItem) {
        UserPersist.shared.userData = nil
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "\(userPersist.userData!.name)"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        moneyLabel.text = "$ \(userPersist.userData!.balance)"
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        didInput = [Bool]()
    }

    @IBAction func aboveButton(_ sender: UIButton) {
        didInput.append(true)
    }
    
    @IBAction func belowButton(_ sender: UIButton) {
        didInput.append(false)
    }
}

