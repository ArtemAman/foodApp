//
//  MainServices.swift
//  Fooder
//
//  Created by Максим Чикинов on 08.02.2022.
//

import Foundation
import Moya

class MainServices {
    
    let provider = MoyaProvider<MainAPI>()
    
    func getRecipesList(query: String, completion: @escaping (Result<Response, MoyaError>) -> Void) {
        provider.request(.recipes(requestingString: query), completion: completion)
    }
    
    func getRecipesListWithParams(requestingString: String, requestingType: Int, completion: @escaping (Result<Response, MoyaError>) -> Void) {
        switch requestingType {
        case 1:
            provider.request(.kitchens(kitchen: requestingString), completion: completion)
        case 2:
            provider.request(.diets(diet: requestingString), completion: completion)
        case 6:
            provider.request(.dishes(dish: requestingString), completion: completion)
        default:
            provider.request(.kitchens(kitchen: requestingString), completion: completion)
        }
        
    }
    
}
