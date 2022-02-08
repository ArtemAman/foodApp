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
    
    func getRecipesList(completion: @escaping (Result<Response, MoyaError>) -> Void) {
        provider.request(.recipes, completion: completion)
    }
    
}