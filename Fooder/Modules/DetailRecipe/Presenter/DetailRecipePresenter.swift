//
//  DetailPresenter.swift
//  Fooder
//
//  Created by Artyom Amankeldiev on 16.02.2022.
//

import UIKit

class DetailRecipePresenter {
    
    weak var view: DetailRecipeViewInput?
    var detailDecipeViewModel: PreSetupedTabletsFirst?
}


extension DetailRecipePresenter: DetailRecipeViewOutput {
    func viewLoaded() {
    
    }
}
