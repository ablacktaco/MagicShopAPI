//
//  SellViewController.swift
//  MagicStoreMix
//
//  Created by 陳姿穎 on 2019/11/11.
//  Copyright © 2019 Jes Yang. All rights reserved.
//

import UIKit

class SellViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        magicIcon.image = image
        magicPrice.text = "\(price!)"
    }
    
    private let userPersist = UserPersist.shared
    var magicBook: MagicBook?
    var vc: MyOwnViewController?
    var image: UIImage?
    var price: Int?
    
    @IBOutlet var magicIcon: UIImageView!
    @IBOutlet var magicPrice: UILabel!
    @IBOutlet var dicisionButtons: [UIButton]! {
        didSet {
            for button in dicisionButtons {
                setViewBorder(view: button, configSetting: .purchaseButton)
            }
        }
    }
    
    @IBAction func tapToSell(_ sender: UIButton) {
        userPersist.user.sell(book: magicBook!)
        dismiss(animated: true) {
            self.vc?.collectionView.reloadData()
        }
    }
    @IBAction func tapToCancel(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    
}
