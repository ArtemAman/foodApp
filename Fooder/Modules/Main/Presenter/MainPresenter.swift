//
//  MainPresenter.swift
//  Fooder
//
//  Created by Максим Чикинов on 08.02.2022.
//

import UIKit

class MainPresenter {
    
    weak var view: MainViewInput?
    
    var firstViewModel: PreSetupedTabletsFirst?
    var secondViewModel: PreSetupedTabletsSecond?
    var thirdViewModel: ReceipViewModel?
    var fourthViewModel: FourthCollectionViewModel?
    var sixthViewModel: PreSetupedTabletsSixth?
    
    let articleParser:ArticleParser = ArticleParser()

    private func getRecipesList(requestingString:String){
        
        MainServices().getRecipesList(query: requestingString) { [weak self] result in
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
        getRecipesList(requestingString: String.random())
        getArticles()
        
    }
    
    func configureDetailRecipeViewController(cellIndex: Int) {
        let detailRecipeModule = DetailRecipeModuleConfigurator().configure(model: thirdViewModel?.cells[cellIndex] as! CellViewModelProtocol)
        let detailRecipeVC = detailRecipeModule.0
        view?.presentDetailRecipe(viewController: detailRecipeVC)
    }
    
    func configureDetailTableViewController(requestingString: String?, requestType: Int) {
        guard let requestingString = requestingString else {
            return
        }
        let detailRecipeModule = DetailTableModuleConfigurator().configure(requestType: requestType, requestString: requestingString)
        let detailRecipeVC = detailRecipeModule.0
        view?.presentDetailRecipe(viewController: detailRecipeVC)
    }
        

}



