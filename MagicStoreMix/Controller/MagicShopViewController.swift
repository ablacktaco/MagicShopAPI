//
//  MagicShopViewController.swift
//  MagicStoreMix
//
//  Created by 陳姿穎 on 2019/11/6.
//  Copyright © 2019 Jes Yang. All rights reserved.
//

import UIKit

class MagicShopViewController: UIViewController {
    
    var magicShopView: MagicShopView { view as! MagicShopView }
    var levelMode: ShopViewState.levelMode = .level1
    var shopMode: ShopViewState.shopMode = .table
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        magicShopView.perpare(vc: self)
        navigationController?.navigationBar.tintColor = .white
    }
    
}

extension MagicShopViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ShopViewState(shopMode: shopMode, levelMode: levelMode).shopList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch shopMode {
        case .table: return CGSize(width: view.frame.width, height: 90)
        case .collection: return CGSize(width: view.frame.width / 4, height: view.frame.width / 4)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch shopMode {
        case .table:
            let cellIdentifier = "tableShopView"
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! TableShopViewCell
            cell.setDefaultProperties()
            cell.setShopData(shopMode: shopMode, levelMode: levelMode, indexPath: indexPath)
            cell.showSoldOutView(shopMode: shopMode, levelMode: levelMode, indexPath: indexPath)
            return cell
        case .collection:
            let cellIdentifier = "collectionShopView"
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! CollectionShopViewCell
            cell.setShopData(shopMode: shopMode, levelMode: levelMode, indexPath: indexPath)
            cell.showSoldOutView(shopMode: shopMode, levelMode: levelMode, indexPath: indexPath)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        magicShopView.showAlertView(shopMode: shopMode, levelMode: levelMode, indexPath: indexPath)
    }
    
}
