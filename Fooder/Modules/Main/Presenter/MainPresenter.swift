//
//  MainPresenter.swift
//  Fooder
//
//  Created by Максим Чикинов on 08.02.2022.
//

import Foundation

class MainPresenter {
    
    weak var view: MainViewInput?
    private var responseFetcher = ResponseFetcher()
    var listOfReceips: ReceiptResponse?
    
    
    
}

// MARK: - Public
extension MainPresenter: MainViewOutput {
    
    func viewLoaded() {
        responseFetcher.fetchListOfRecipes(completion: { listOfRecieps in
            guard let myListOfRecieps = listOfRecieps else { return }
            self.listOfReceips = myListOfRecieps
            print(self.listOfReceips!)
        })
        
    }
}



