//
//  User.swift
//  MagicStoreMix
//
//  Created by Jes Yang on 2019/11/6.
//  Copyright © 2019 Jes Yang. All rights reserved.
//

import Foundation

struct User: Codable {
    var data: Data
    
    struct Data: Codable {
        var name: String
        var balance: Int
        var api_token: String
    }
}

struct Login: Codable {
    var account: String
    var password: String
}

struct Register: Codable {
    var name: String
    var account: String
    var password: String
    var email: String
}

struct Token: Codable {
    var api_token: String
}

struct UserQQ: Codable {
    private(set) var name: String
    private(set) var totalMoney: Int
    private(set) var purchased: Set<Int>
    
    func getMoney() -> Int {
        return self.totalMoney
    }
    
    func getPurchased(book: MagicBook) -> Bool {
        return purchased.contains(book.id)
    }
    
    mutating func addMoney() {
        totalMoney += 100
    }
    
    mutating func purchase(book: MagicBook) {
        if totalMoney >= book.price && !purchased.contains(book.id) {
            totalMoney -= book.price
            purchased.insert(book.id)
        }
    }
    
    mutating func sell(book: MagicBook) {

        if  purchased.contains(book.id) {

            totalMoney += book.price
            purchased.remove(book.id)
        }
    }
}


class UserPersist {
        
    static let shared = UserPersist()
    
    var userData: User.Data? = getUserData() {
        didSet {
            if let data = try? PropertyListEncoder().encode(self.userData) {
                UserDefaults.standard.set(data, forKey: "userData")
            }
        }
    }
    private static func getUserData() -> User.Data? {
        if let userData = UserDefaults.standard.object(forKey: "userData") as? Data {
            if let data = try? PropertyListDecoder().decode(User.Data.self, from: userData) {
                return data
            }
        }
        return nil
    }
    
    
    var user: UserQQ = loadData() ?? UserQQ(name: "超級 iOS 協作隊", totalMoney: 2000, purchased: Set<Int>()) {
        didSet {
            saveData(user: self.user)
        }
    }
    
    private init() {
        print("Singleton initialized")
    }
    
    private func saveData(user: UserQQ) {

        // Use PropertyListEncoder to convert Player into Data / NSData
        do {
            let userData = try PropertyListEncoder().encode(user)
            UserDefaults.standard.set(userData, forKey: "userKey")
        } catch {
            print("Save data error.")
        }
    }
    
    static func loadData() -> UserQQ? {
        guard let userData = UserDefaults.standard.object(forKey: "userKey") as? Data else {
            return nil
        }
        
        // Use PropertyListDecoder to convert Data into Player
        guard let user = (try? PropertyListDecoder().decode(UserQQ.self, from: userData)) else {
            print("Load data error.")
            return nil
        }
        
        return user
    }
}

