//
//  API.swift
//  assessment
//
//  Created by Francis on 3/18/22.
//

import Foundation
import Alamofire
import SwiftyJSON

class Api {
    static func call<D: Codable>(_ router: APIRouter,
                                 dataType: D.Type,
                                 completion: @escaping (Result<D, Swift.Error>) -> Void) {
        do {
            var req = try router.asURLRequest()
            req.cachePolicy = .reloadIgnoringLocalAndRemoteCacheData
            req.timeoutInterval = 60
            
            AF.request(req).responseData { (response) in
                switch response.result{
                case .success(let res):
                    do {
                        let jsonData = try? JSON(data: res)
                        print(jsonData)
                        let data = try JSONDecoder().decode(D.self, from: res)
                        completion(.success(data))
                    } catch (let error) {
                        completion(.failure(error))
                    }
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        } catch (let err) {
            completion(.failure(err))
        }
    }
}
