//
//  FavouritePresenter.swift
//  Fooder
//
//  Created by Artyom Amankeldiev on 14.02.2022.
//


import UIKit


class FavouritePresenter {
    
    var favouriteRecipeModel: ReceipViewModel?
    var favouriteArticleModel: [DetailArticleViewModel]?
    weak var view: FavouriteViewInput?
    
    private func prepareRecipeModel() {
        
        let infoFromBase = RealmBase.getAllRecipes()
        favouriteRecipeModel = ReceipViewModel(infoFromBase)
        
    }
    
    private func prepareArticleModel() {
        
        let infoFromBase = RealmBase.getAllArticles()
        favouriteArticleModel = infoFromBase.map({ model in
            DetailArticleViewModel(articleFromBase: model)
        })
        
    }
}



extension FavouritePresenter: FavouriteOutput {
    
    func viewLoaded() {
        prepareRecipeModel()
        prepareArticleModel()
        view?.updateTable()
    }
    
}
