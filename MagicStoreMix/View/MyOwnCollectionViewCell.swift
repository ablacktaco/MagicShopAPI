//
//  MyOwnCollectionViewCell.swift
//  MagicStoreMix
//
//  Created by 黃士軒 on 2019/11/6.
//  Copyright © 2019 Jes Yang. All rights reserved.
//

import UIKit

class MyOwnCollectionViewCell: UICollectionViewCell {
    
    private let userPersist = UserPersist.shared
    
    @IBOutlet weak var magicIcon: UIImageView!
    @IBOutlet weak var shadowView: UIView!
    
}


extension MyOwnCollectionViewCell {
    
    func hideShadowView(_ id: Int) {
        shadowView.isHidden = userPersist.user.purchased.contains(id) ? true : false
    }
    
}
