//
//  TableShopViewCell.swift
//  MagicStoreMix
//
//  Created by 陳姿穎 on 2019/11/8.
//  Copyright © 2019 Jes Yang. All rights reserved.
//

import UIKit

class TableShopViewCell: UICollectionViewCell {
    
    private let userPersist = UserPersist.shared
    
    @IBOutlet private var magicIcon: UIImageView!
    @IBOutlet private var magicName: UILabel!
    @IBOutlet private var magicPrice: UILabel!
    @IBOutlet private var soldOutView: UIView!
    
}

extension TableShopViewCell {
    
    func setDefaultProperties() {
        setViewBorder(view: self, configSetting: .cellBorder)
    }
    
    func setShopData(shopMode: ShopViewState.shopMode, levelMode: ShopViewState.levelMode, indexPath: IndexPath) {
        let shopList = ShopViewState(shopMode: shopMode, levelMode: levelMode).shopList
        magicIcon.image = UIImage(named: shopList[indexPath.row].name)
        magicName.text = "\(shopList[indexPath.row].name)"
        magicPrice.text = "$ \(shopList[indexPath.row].price)"
    }
    
    func showSoldOutView(shopMode: ShopViewState.shopMode, levelMode: ShopViewState.levelMode, indexPath: IndexPath) {
        let shopList = ShopViewState(shopMode: shopMode, levelMode: levelMode).shopList
        soldOutView.isHidden = userPersist.user.purchased.contains(shopList[indexPath.row].id) ? false : true
    }
    
}
