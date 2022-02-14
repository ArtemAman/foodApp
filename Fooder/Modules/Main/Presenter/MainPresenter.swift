//
//  MainPresenter.swift
//  Fooder
//
//  Created by Максим Чикинов on 08.02.2022.
//

import Foundation

class MainPresenter {
    
    weak var view: MainViewInput?
    
    var firstViewModel: ReceipViewModel?
    let articleParser:ArticleParser = ArticleParser()

    private func getRecipesList() {
        MainServices().getRecipesList(query: "Asia") { [weak self] result in
            switch result {
            case .success(let succes):
                let listOfReceips = Parser<RecipeResponse>().parce(data: succes.data)
                self?.prepareViewModel(listOfReceips: listOfReceips)
            case .failure(let erorr):
                print(erorr.localizedDescription)
                /// view?.showError(error: error)
            }
        }
    }
    
    private func prepareViewModel(listOfReceips: RecipeResponse?) {
        firstViewModel = ReceipViewModel(list: listOfReceips)
        self.view?.updateTable()
    }
}

// MARK: - Public
extension MainPresenter: MainViewOutput {
    func viewLoaded() {
        getRecipesList()
        articleParser.scrapeNYCMetalScene()
    }
}



