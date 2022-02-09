//
//  DataFetcher.swift
//  Fooder
//
//  Created by Artyom Amankeldiev on 09.02.2022.
//

import UIKit


class ResponseFetcher {
    
    let mainService = MainServices()
   
    // fetches data from the response Data
    
    func fetchListOfRecipes(completion: @escaping(ReceiptResponse?) -> Void){
        
        let query = "q"
        mainService.getRecipesList(query: query) { result in
            switch result {
            case .success(let data):
                print(data)
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let infoToReturn = try? decoder.decode(ReceiptResponse.self, from: data.data)
                completion(infoToReturn)
            case .failure(let error):
                print(error)
                completion(nil)
            }
        }
    }
}
