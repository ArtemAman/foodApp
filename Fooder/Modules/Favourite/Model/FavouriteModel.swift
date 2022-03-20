//
//  FavouriteModel.swift
//  Fooder
//
//  Created by Artyom Amankeldiev on 17.03.2022.
//

import UIKit

protocol FavouriteCellViewModelProtocol {
    
    var imageUrlString: String? { get }
    var name: String? { get }
}


struct FavouriteCell: FavouriteCellViewModelProtocol {
    
    var imageUrlString: String?
    var name: String?

    init(recipe: CellViewModelProtocol?) {
        
        imageUrlString = recipe?.imageUrlString
        name = recipe?.name
    }
    
    init(article: FourthCellViewModelProtocol?) {
        
        imageUrlString = article?.imageUrlString
        name = article?.name
    }
}
