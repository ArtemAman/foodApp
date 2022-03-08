//
//  DetailPresenter.swift
//  Fooder
//
//  Created by Artyom Amankeldiev on 16.02.2022.
//

import UIKit

class DetailRecipePresenter {
    
    weak var view: DetailRecipeViewInput?
    var detailRecipeViewModel: CellViewModelProtocol?
    
    init(model:CellViewModelProtocol?) {
        self.detailRecipeViewModel = model
    }
}


extension DetailRecipePresenter: DetailRecipeViewOutput {
    func viewLoaded() {
        guard detailRecipeViewModel != nil else { return }
        view?.setupInfo()
    }
}
