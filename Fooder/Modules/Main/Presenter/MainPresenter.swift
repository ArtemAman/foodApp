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
    var secondViewModel: PreSetupedTabletsSecond?
    var thirdViewModel: ReceipViewModel?
    var fourthViewModel: FourthCollectionViewModel?
    var sixthViewModel: PreSetupedTabletsSixth?
    
    let articleParser:ArticleParser = ArticleParser()

    private func getRecipesList(){
        let randomString = String.random()
        MainServices().getRecipesList(query: randomString) { [weak self] result in
            switch result {
            case .success(let succes):
                let listOfReceips = Parser<RecipeResponse>().parce(data: succes.data)
                self?.prepareThirdViewModel(listOfReceips: listOfReceips)
            case .failure(let erorr):
                print(erorr.localizedDescription)
            }
        }
    }
    
    private func getArticles() {
        let articles = articleParser.scrapeNews(page: "1") { [weak self] articles in
            self?.prepareFourthModel(listOfArticles: articles)
        }
        
    }
    

}

// MARK: - Public
extension MainPresenter: MainViewOutput {

    
    
    private func prepareThirdViewModel(listOfReceips: RecipeResponse?) {
        thirdViewModel = ReceipViewModel(list: listOfReceips)
        self.view?.updateTable()
    }
    
    private func preparePreSetupedModels() {
        sixthViewModel = PreSetupedTabletsSixth()
        firstViewModel = PreSetupedTabletsFirst()
        secondViewModel = PreSetupedTabletsSecond()
    }
    
    private func prepareFourthModel(listOfArticles: [Article?]) {
        fourthViewModel = FourthCollectionViewModel(list: listOfArticles)
        
        self.view?.updateTable()

    }
    
    func viewLoaded() {
        preparePreSetupedModels()
        getRecipesList()
        getArticles()
        
    }
}



