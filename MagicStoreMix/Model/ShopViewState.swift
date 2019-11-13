//
//  shopMode.swift
//  MagicStoreMix
//
//  Created by 陳姿穎 on 2019/11/7.
//  Copyright © 2019 Jes Yang. All rights reserved.
//

import Foundation

struct ShopViewState {
    
    let magicBook = MagicBookList.shared
//    private let bookList: MagicBookList = MagicBookList()
    
    var shopMode: shopMode
    enum shopMode {
        case table
        case collection
    }
    
    var levelMode: levelMode
    enum levelMode {
        case level1
        case level2
        case level3
    }

    var shopList: [MagicBook.Data] {

        switch self.levelMode {
        case .level1:
            return magicBook.level1
        case .level2:
            return magicBook.level2
        case .level3:
            return magicBook.level3
        }
    }
}
