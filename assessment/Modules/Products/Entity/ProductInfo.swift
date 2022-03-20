//
//  ProductInfo.swift
//  assessment
//
//  Created by Francis on 3/19/22.
//

import Foundation

struct ProductInfo: Codable {
    
}

// MARK: - ProductModel
struct ProductModel: Codable {
    let id: Int?
    let image: String?
    let createdDate, name: String?
    let amount: Int?
    let description: String?
    let category: Category?

    enum CodingKeys: String, CodingKey {
        case id, image, createdDate, name, amount
        case description
        case category
    }
}

// MARK: - Category
struct Category: Codable {
    let id: Int?
    let createdDate, name: String?
} 
