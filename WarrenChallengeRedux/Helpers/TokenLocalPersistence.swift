//
//  TokenLocalPersistence.swift
//  WarrenChallengeRedux
//
//  Created by Heitor Feijó Kunrath on 14/11/22.
//

import Foundation

protocol SaveTokenInPersistence {
    
    func saveToken(token: String)
    
}

protocol FetchTokenFromMemory {
    
    func fetchTokenFromMemory() -> String?
    
}

struct UserDefaultsHelper: SaveTokenInPersistence, FetchTokenFromMemory {
    
    func saveToken(token: String) {
        let defaults = UserDefaults.standard
        defaults.set(token, forKey: "token")
    }
    
    func fetchTokenFromMemory() -> String? {
        let defaults = UserDefaults.standard
        return defaults.string(forKey: "token")
    }
    
}
