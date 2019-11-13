//
//  PurchaseView.swift
//  MagicStoreMix
//
//  Created by 陳姿穎 on 2019/11/9.
//  Copyright © 2019 Jes Yang. All rights reserved.
//

import UIKit

class PurchaseView: UIView {

    private weak var pvc: PurchaseViewController?
    private let userPersist = UserPersist.shared
    private var magicBook: MagicBook.Data?
    
    @IBOutlet private var magicIcon: UIImageView!
    @IBOutlet private var magicPrice: UILabel!
    @IBOutlet private var dicisionButton: [UIButton]! {
        didSet {
            for button in dicisionButton {
                setViewBorder(view: button, configSetting: .purchaseButton)
            }
        }
    }
    
    @IBAction private func tapToPurchase(_ sender: UIButton) {
//        userPersist.user.purchase(book: magicBook!)
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(1), execute: {
            self.removeFromSuperview()
            self.pvc?.shopIsUserInteractionEnabled(true)
            self.pvc?.setUserMoney()
            self.pvc?.reloadCollectionView()
        })
    }
    @IBAction private func tapToCancelPurchase(_ sender: UIButton) {
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(1), execute: {
            self.removeFromSuperview()
            self.pv?.shopIsUserInteractionEnabled(true)
        })
    }
    
}

extension PurchaseView {
    
    func perpare(pvc: PurchaseViewController) { self.pvc = pvc }
    
    func setData(shopMode:ShopViewState.shopMode, levelMode: ShopViewState.levelMode, indexPath: IndexPath) {
        let shopList = ShopViewState(shopMode: shopMode, levelMode: levelMode).shopList
        magicBook = shopList[indexPath.row]
        magicIcon.image = UIImage(named: "\(shopList[indexPath.row].name)")
        magicPrice.text = "$ \(shopList[indexPath.row].price)"
    }
    
}
