//
//  MainAPI.swift
//  Fooder
//
//  Created by Максим Чикинов on 08.02.2022.
//

import Foundation
import Moya

enum MainAPI {
    case recipes(query: String)
}

extension MainAPI: TargetType {
    var baseURL: URL {
        return ServerConstants.baseUrl
    }
    
    var path: String {
        switch self {
        case .recipes:
            return "/locations/v2/search"
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
        case .recipes(let query):
            return .requestParameters(parameters: ["query" : query], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        return ServerConstants.requestHeader
    }
    
    var sampleData: Data {
        return Data()
    }
}
