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
    
    
    func favourite(ifWeWriteToBase: Bool) {
        guard let detailRecipeViewModel = detailRecipeViewModel else { return }
        if ifWeWriteToBase == true {
            let base = RecipeBaseModel(model: detailRecipeViewModel)
            RealmBase.saveData(base)
        } else {
            RealmBase.deleteOne(detailRecipeViewModel.imageUrlString!, requestedModel: .recipes)
        }
    }
   
    func viewLoaded() {
//        RealmBase.deleteAll()
        guard detailRecipeViewModel != nil else { return }
        let base = RecipeBaseModel(model: detailRecipeViewModel!)
        let checkTheBase = RealmBase.checkOneRecipe(base)
        if checkTheBase {
            view?.isInBase = true
        }
        view?.setupInfo()
    }
}
