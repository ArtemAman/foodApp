//
//  MainAPI.swift
//  Fooder
//
//  Created by Максим Чикинов on 08.02.2022.
//

import Foundation
import Moya

enum MainAPI {
    case recipes(requestingString: String)
    case kitchens(kitchen: String)
    case diets(diet: String)
    case dishes(dish: String)

}

extension MainAPI: TargetType {
    
    var baseURL: URL {
        return ServerConstants.baseUrl
    }
    
    var path: String {
        switch self {
        default:
            return ""
        }
    }
    
    var method: Moya.Method {
        switch self {
        default:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .recipes(let requestingString):
            return .requestParameters(
                parameters:
                    ["q" : requestingString,
                     "type" : ServerConstants.type,
                     "app_key": ServerConstants.appKey,
                     "app_id": ServerConstants.appId],
                encoding: URLEncoding.queryString)
       
        case .kitchens(kitchen: let kitchen):
            return .requestParameters(
                parameters:
                    ["cuisineType" : kitchen,
                     "type" : ServerConstants.type,
                     "app_key": ServerConstants.appKey,
                     "app_id": ServerConstants.appId],
                encoding: URLEncoding.queryString)
        case .diets(diet: let diet):
            return .requestParameters(
                parameters:
                    ["diet" : diet,
                     "type" : ServerConstants.type,
                     "app_key": ServerConstants.appKey,
                     "app_id": ServerConstants.appId],
                encoding: URLEncoding.queryString)
        case .dishes(dish: let dish):
            return .requestParameters(
                parameters:
                    ["mealType" : dish,
                     "type" : ServerConstants.type,
                     "app_key": ServerConstants.appKey,
                     "app_id": ServerConstants.appId],
                encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        switch self {
        default:
            return nil
        }
    }
    
    
    var sampleData: Data {
        return Data()
    }
}
