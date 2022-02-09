//
//  MainPresenter.swift
//  Fooder
//
//  Created by Максим Чикинов on 08.02.2022.
//

import Foundation

class MainPresenter {
    
    weak var view: MainViewInput?
    
    let mainService = MainServices()
    
}

// MARK: - Public
extension MainPresenter: MainViewOutput {
    
    func viewLoaded() {
        mainService.getRecipesList(query: "chicken") { result in
            switch result {
            case .success(let data):
                print(data)
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let info = try? decoder.decode(ReceiptResponse.self, from: data.data)
            print(info)
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
