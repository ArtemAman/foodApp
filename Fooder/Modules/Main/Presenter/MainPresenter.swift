//
//  MainPresenter.swift
//  Fooder
//
//  Created by Максим Чикинов on 08.02.2022.
//

import Foundation

class MainPresenter {
    
    weak var view: MainViewInput?
    
    var firstViewModel: PreSetupedTabletsFirst?
    let articleParser:ArticleParser = ArticleParser()

    private func getRecipesList() {
        MainServices().getRecipesList(query: "Asia") { [weak self] result in
            switch result {
            case .success(let succes):
                let listOfReceips = Parser<RecipeResponse>().parce(data: succes.data)
//                self?.prepareViewModel(listOfReceips: listOfReceips)
            case .failure(let erorr):
                print(erorr.localizedDescription)
                /// view?.showError(error: error)
            }
        }
    }
    

}

// MARK: - Public
extension MainPresenter: MainViewOutput {
    
    private func prepareViewModel() {
        firstViewModel = PreSetupedTabletsFirst()
        self.view?.updateTable()
    }
    
    func viewLoaded() {
        getRecipesList()
        prepareViewModel()
        articleParser.scrapeNews(page: "2")
    }
}



