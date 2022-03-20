//
//  ResponseResult.swift
//  assessment
//
//  Created by Francis on 3/20/22.
//

import Foundation

struct ResultResponse<T: Codable>: Codable {
    let page: Int
    let size: Int
    let totalElements: Int
    let totalPages: Int
    let last: Bool?
    let content: [ProductModel] 
}
