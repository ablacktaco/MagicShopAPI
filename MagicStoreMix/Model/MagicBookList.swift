//
//  MagicBookList.swift
//  MagicStoreMix
//
//  Created by Jes Yang on 2019/11/6.
//  Copyright © 2019 Jes Yang. All rights reserved.
//

import Foundation

struct MagicBook: Codable {
    let id: Int
    let name: String
    let level: Int
    let price: Int
}

class MagicBookList {
    
    let bookLists: [MagicBook] = [
        MagicBook(id: 0, name: "保護罩", level: 1, price: 100),
        MagicBook(id: 1, name: "光箭", level: 1, price: 100),
        MagicBook(id: 2, name: "冰箭", level: 1, price: 100),
        MagicBook(id: 3, name: "初級治癒術", level: 1, price: 100),
        MagicBook(id: 4, name: "指定傳送", level: 1, price: 100),
        MagicBook(id: 5, name: "日光術", level: 1, price: 100),
        MagicBook(id: 6, name: "神聖武器", level: 1, price: 100),
        MagicBook(id: 7, name: "風刃", level: 1, price: 100),
        MagicBook(id: 8, name: "地獄之牙", level: 2, price: 300),
        MagicBook(id: 9, name: "寒冷戰慄", level: 2, price: 300),
        MagicBook(id: 10, name: "擬似魔法武器", level: 2, price: 300),
        MagicBook(id: 11, name: "毒咒", level: 2, price: 300),
        MagicBook(id: 12, name: "火箭", level: 2, price: 300),
        MagicBook(id: 13, name: "無所遁形術", level: 2, price: 300),
        MagicBook(id: 14, name: "解毒術", level: 2, price: 300),
        MagicBook(id: 15, name: "負重強化", level: 2, price: 300),
        MagicBook(id: 16, name: "中級治癒術", level: 3, price: 500),
        MagicBook(id: 17, name: "寒冰氣息", level: 3, price: 500),
        MagicBook(id: 18, name: "極光雷電", level: 3, price: 500),
        MagicBook(id: 19, name: "能量感測", level: 3, price: 500),
        MagicBook(id: 20, name: "起死回生術", level: 3, price: 500),
        MagicBook(id: 21, name: "鎧甲護持", level: 3, price: 500),
        MagicBook(id: 22, name: "闇盲咒術", level: 3, price: 500)
    ]
    
    var level1: [MagicBook] {
        return bookLists.filter {($0.level == 1)}
    }
    
    var level2: [MagicBook] {
        return bookLists.filter {($0.level == 2)}
    }
    
    var level3: [MagicBook] {
        return bookLists.filter {($0.level == 3)}
    }
    
}
