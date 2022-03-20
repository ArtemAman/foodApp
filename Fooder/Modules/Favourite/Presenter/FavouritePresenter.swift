//
//  FavouritePresenter.swift
//  Fooder
//
//  Created by Artyom Amankeldiev on 14.02.2022.
//


import UIKit


class FavouritePresenter {
    
    var favouriteRecipeModel: ReceipViewModel?
    weak var view: FavouriteViewInput?
    
    private func prepareRecipeModel() {
        
        let infoFromBase = RealmBase.getAll()
        favouriteRecipeModel = ReceipViewModel(infoFromBase)
        view?.updateTable()
    }
}



extension FavouritePresenter: FavouriteOutput {
    
    func viewLoaded() {
        prepareRecipeModel()
    }
    
}
