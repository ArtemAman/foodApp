//
//  DetailTablePresenter.swift
//  Fooder
//
//  Created by Artyom Amankeldiev on 16.02.2022.
//


import UIKit

class DetailTablePresenter {
    
    weak var view: DetailTableViewInput?
    var recipeViewModel: ReceipViewModel?
    var requestType: Int
    var requestString: String
    
    init(requestType: Int, requestString: String) {
        self.requestType = requestType
        self.requestString = requestString
    }
    
    private func getRecipesList(){
        
        MainServices().getRecipesListWithParams(requestingString: requestString, requestingType: requestType) { [weak self] result in
            switch result {
            case .success(let succes):
                let listOfReceips = Parser<RecipeResponse>().parce(data: succes.data)
                self?.prepareViewModel(listOfReceips: listOfReceips)
            case .failure(let erorr):
                print(erorr.localizedDescription)
            }
        }
    }
}


extension DetailTablePresenter: DetailTableViewOutput {
    
    func viewLoaded() {
        getRecipesList()
    }
    
    
    private func prepareViewModel(listOfReceips: RecipeResponse?) {
        recipeViewModel = ReceipViewModel(list: listOfReceips)
        self.view?.updateTable()
    }
}
