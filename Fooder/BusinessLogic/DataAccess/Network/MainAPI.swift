//
//  MainAPI.swift
//  Fooder
//
//  Created by Максим Чикинов on 08.02.2022.
//

import Foundation
import Moya

enum MainAPI {
    case recipes(q: String)

}

extension MainAPI: TargetType {
    
    var baseURL: URL {
        return ServerConstants.baseUrl
    }
    
    var path: String {
        switch self {
        case .recipes:
            return ""
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .recipes:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .recipes(let q):
            return .requestParameters(
                parameters:
                    ["q" : q,
                     "type" : ServerConstants.type,
                     "app_key": ServerConstants.appKey,
                     "app_id": ServerConstants.appId],
                encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .recipes:
            return nil
        }
    }
    
    
    var sampleData: Data {
        return Data()
    }
}
