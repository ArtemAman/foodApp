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
    var listOfReceips: RecipeResponse?
    
    
    
}

// MARK: - Public
extension MainPresenter: MainViewOutput {
    
    func viewLoaded() {
        
        responseFetcher.fetchListOfRecipes(completion: { result in
            guard let myListOfRecieps = listOfRecipes else { return }
            self.listOfReceips = myListOfRecieps
            
            print(self.listOfReceips!)
        })
        
        print(self.listOfReceips)
        
    }
}



