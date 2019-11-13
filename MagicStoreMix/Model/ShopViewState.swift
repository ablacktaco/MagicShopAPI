//
//  shopMode.swift
//  MagicStoreMix
//
//  Created by 陳姿穎 on 2019/11/7.
//  Copyright © 2019 Jes Yang. All rights reserved.
//

import Foundation

struct ShopViewState {
    
    private let bookList: MagicBookList = MagicBookList()
    
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

    var shopList: [MagicBook] {

        switch self.levelMode {
        case .level1:
            return bookList.level1
        case .level2:
            return bookList.level2
        case .level3:
            return bookList.level3
        }
    }
}
