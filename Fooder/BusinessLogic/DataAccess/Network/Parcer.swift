//
//  Parcer.swift
//  Fooder
//
//  Created by Максим Чикинов on 09.02.2022.
//

import Foundation

class Parser<T: Decodable> {
    
    func parce(data: Data) -> T? {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        do {
            return try decoder.decode(T.self, from: data)
        } catch let error {
            print(error.localizedDescription)
            return nil
        }
    }
    
}
