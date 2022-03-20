//
//  APIRouter.swift
//  assessment
//
//  Created by Francis on 3/18/22.
//

import Foundation
import Alamofire

struct Constants{
    static var BASE_URL: String {
        return "https://assessment-api.hivestage.com/api/"
    }
}

enum APIRouter: URLRequestConvertible {
    case logIn(info: LogInInfo)
    case products
    
    // MARK: - HTTPMethod
    private var method: HTTPMethod {
        switch self {
        case .logIn:
            return .post
        default:
            return .get
        }
    }
    
    // MARK: - Path
    private var path: String {
        switch self {
        case .logIn: return "auth/login"
        case .products: return "products"
        }
    }
    
    // MARK: - Parameters
    private var parameters: Parameters? {
        switch self {
        case .logIn(let info):
            return info.formData
        default:
            return nil
        }
    }
    
    private var authorization: String? {
        switch self {
        case .logIn:
            return nil
        default:
            return DataStore.shared.token
        }
    }
    
    var url: URL? {
        var queryItems: [URLQueryItem] = []
        
        switch self {
        case .products:
            queryItems = [URLQueryItem(name: "page",  value: "1"), URLQueryItem(name: "size",  value: "6")]
        default:
            break
        }
        
        if queryItems.isEmpty {
            return try? Constants.BASE_URL.asURL()
        } else {
            let urlComponents = NSURLComponents(string: Constants.BASE_URL)
            urlComponents?.queryItems = queryItems
            return urlComponents?.url
        }
    }
    
    // MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        guard let url = self.url else {
            throw NSError(domain: "URL Invalid", code: 9999, userInfo: nil)
        }
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        print(urlRequest.url)
        // HTTP Method
        urlRequest.httpMethod = method.rawValue
        
        // Authorization with Token
        if let token = self.authorization {
            urlRequest.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        }
        let headers: HTTPHeaders = [ "Content-Type": "application/json" ]
        urlRequest.headers = headers
        
        // Parameters
        if let parameters = parameters {
            do {
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
            } catch {
                print("Error encoding parameters : \n \(error)")
                throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
            }
        }
        return urlRequest
    }
}
