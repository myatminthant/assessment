//
//  Entity.swift
//  assessment
//
//  Created by Francis on 3/18/22.
//

import Foundation

struct LogInInfo: Codable {
    var username: String
    var password: String
    
    enum CodingKeys: String, CodingKey {
        case username, password
    }
    
    var formData: [String: Any] {
        return [
            "username": username,
            "password": password,
        ]
    }
}

struct LogInModel: Codable {
    var token: String
    
    enum CodingKeys: String, CodingKey {
        case token
    }
}
