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
    var thirdViewModel: ReceipViewModel?
    var sixthViewModel: PreSetupedTabletsSixth?
    let articleParser:ArticleParser = ArticleParser()

    private func getRecipesList() {
        let randomString = String.random()
        MainServices().getRecipesList(query: randomString) { [weak self] result in
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
    

}

// MARK: - Public
extension MainPresenter: MainViewOutput {
    
    private func prepareViewModel(listOfReceips: RecipeResponse?) {
        firstViewModel = PreSetupedTabletsFirst()
        thirdViewModel = ReceipViewModel(list: listOfReceips)
        sixthViewModel = PreSetupedTabletsSixth()
        self.view?.updateTable()
    }
    
    func viewLoaded() {
        getRecipesList()
        articleParser.scrapeNews(page: "2")
    }
}



