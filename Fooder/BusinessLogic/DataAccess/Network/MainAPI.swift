//
//  MainAPI.swift
//  Fooder
//
//  Created by Максим Чикинов on 08.02.2022.
//

import Foundation
import Moya

enum MainAPI {
    case recipes
}

extension MainAPI: TargetType {
    var baseURL: URL {
        return ServerConstants.baseUrl
    }
    
    var path: String {
        switch self {
        case .recipes:
            return "/recipes"
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
        case .recipes:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return ServerConstants.requestHeader
    }
    
    var sampleData: Data {
        return Data()
    }
}
