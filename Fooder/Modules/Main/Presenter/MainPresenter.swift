//
//  MainPresenter.swift
//  Fooder
//
//  Created by Максим Чикинов on 08.02.2022.
//

import Foundation

class MainPresenter {
    
    weak var view: MainViewInput?
    var listOfReceips: ReceiptResponse?
    
}

// MARK: - Public
extension MainPresenter: MainViewOutput {
    
    func viewLoaded() {
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
    }
}



