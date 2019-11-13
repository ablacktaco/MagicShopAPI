//
//  MagicShopView.swift
//  MagicStoreMix
//
//  Created by 陳姿穎 on 2019/11/7.
//  Copyright © 2019 Jes Yang. All rights reserved.
//

import UIKit

class MagicShopView: UIView {
    
    private weak var vc: MagicShopViewController?
    private let screenBounds: CGRect = UIScreen.main.bounds
    private let userPersist = UserPersist.shared
    
    @IBOutlet private var changeLevelStateButton: [UIButton]! {
        didSet {
            for button in changeLevelStateButton {
                setViewBorder(view: button, configSetting: .viewBorder)
            }
            changeLevelStateButton[0].backgroundColor = .lead
        }
    }
    @IBOutlet private var changeShopViewStateButton: [UIButton]! {
        didSet {
            for button in changeShopViewStateButton {
                button.contentEdgeInsets = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
                setViewBorder(view: button, configSetting: .viewBorder)
            }
            changeShopViewStateButton[0].backgroundColor = .lead
        }
    }
    @IBOutlet private var moneyView: UIView! {
        didSet { setViewBorder(view: moneyView, configSetting: .viewBorder) }
    }
    @IBOutlet private var userMoney: UILabel! {
        didSet { setUserMoney() }
    }
    @IBOutlet private var magicShopCollectionView: UICollectionView! {
        didSet { setViewBorder(view: magicShopCollectionView, configSetting: .viewBorder) }
    }
    
    @IBAction private func tapToSwitchLevel1(_ sender: UIButton) {
        vc?.levelMode = .level1
        resetLevelButtonColor(sender)
        reloadCollectionView()
    }
    @IBAction private func tapToSwitchLevel2(_ sender: UIButton) {
        vc?.levelMode = .level2
        resetLevelButtonColor(sender)
        reloadCollectionView()
    }
    @IBAction private func tapToSwitchLevel3(_ sender: UIButton) {
        vc?.levelMode = .level3
        resetLevelButtonColor(sender)
        reloadCollectionView()
    }
    @IBAction private func tapToSwitchTable(_ sender: UIButton) {
        vc?.shopMode = .table
        resetShopViewButtonColor(sender)
        reloadCollectionView()
    }
    @IBAction private func tapToSwitchCollection(_ sender: UIButton) {
        vc?.shopMode = .collection
        resetShopViewButtonColor(sender)
        reloadCollectionView()
    }
    
}

extension MagicShopView {
    
    fileprivate func resetLevelButtonColor(_ sender: UIButton) {
        for button in changeLevelStateButton {
            button.backgroundColor = .darkGray
        }
        sender.backgroundColor = .lead
    }
    
    fileprivate func resetShopViewButtonColor(_ sender: UIButton) {
        for button in changeShopViewStateButton {
            button.backgroundColor = .darkGray
        }
        sender.backgroundColor = .lead
    }
    
    func perpare(vc: MagicShopViewController) { self.vc = vc }
    
    func setUserMoney() {
        userMoney.text = "$ \(UserPersist.shared.user.totalMoney)"
    }

    func showAlertView(shopMode:ShopViewState.shopMode, levelMode: ShopViewState.levelMode, indexPath: IndexPath) {
        let shopList = ShopViewState(shopMode: shopMode, levelMode: levelMode).shopList
        if !userPersist.user.purchased.contains(shopList[indexPath.row].id) {
            if let alertVC = vc?.storyboard?.instantiateViewController(withIdentifier: "alertVC") as? PurchaseViewController {
                alertVC.vc = vc
                alertVC.levelMode = levelMode
                alertVC.shopMode = shopMode
                alertVC.index = indexPath.row
                vc?.present(alertVC, animated: false, completion: nil)
            }
        }
    }
    
    func reloadCollectionView() {
        magicShopCollectionView.reloadData()
    }
}

extension UIColor {
    class var lead: UIColor {
        UIColor(red: 33.0/255.0, green: 33.0/255.0, blue: 33.0/255.0, alpha: 1.0)
    }
}
