//
//  DataStore.swift
//  assessment
//
//  Created by Francis on 3/18/22.
//

import Foundation

struct DataStore {
    struct Key {
        static let token = "token"
    }
    
    static var shared = DataStore()
    
    private let defaults = UserDefaults.standard
    
    var token: String {
        set {
            defaults.set(newValue, forKey: Key.token)
        }
        
        get {
            return defaults.string(forKey: Key.token) ?? ""
        }
    }
}
