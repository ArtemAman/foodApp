//
//  MainPresenter.swift
//  Fooder
//
//  Created by Максим Чикинов on 08.02.2022.
//

import Foundation

class MainPresenter {
    
    weak var view: MainViewInput?
<<<<<<< HEAD
    private var responseFetcher = ResponseFetcher()
    var listOfReceips: RecipeResponse?
=======
    var listOfReceips: ReceiptResponse?
>>>>>>> dff44f0b8c94e8d17f09c594b2f805adb82dee62
    
}

// MARK: - Public
extension MainPresenter: MainViewOutput {
    
    func viewLoaded() {
<<<<<<< HEAD
        
        responseFetcher.fetchListOfRecipes(completion: { result in
            guard let myListOfRecieps = listOfRecipes else { return }
            self.listOfReceips = myListOfRecieps
            
            print(self.listOfReceips!)
        })
        
        print(self.listOfReceips)
        
=======
        MainServices().getRecipesList(query: "k") { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let succes):
                self.listOfReceips = Parser<ReceiptResponse>().parce(data: succes.data)
            case .failure(let erorr):
                print(erorr.localizedDescription)
                /// view?.showError(error: error)
            }
        }
>>>>>>> dff44f0b8c94e8d17f09c594b2f805adb82dee62
    }
}



