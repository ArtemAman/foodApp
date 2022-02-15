//
//  ArticlesPresenter.swift
//  Fooder
//
//  Created by Artyom Amankeldiev on 10.02.2022.
//

class ArticlesPresenter {
    
    weak var view: ArticlesViewInput?
    let articleParser:ArticleParser = ArticleParser()
    var fourthViewModel: FourthCollectionViewModel?
    
}


extension ArticlesPresenter: ArticlesViewOutput {


    private func getArticles() {
        let articles = articleParser.scrapeNews(page: "1") { [weak self] articles in
            self?.prepareFourthModel(listOfArticles: articles)
        }
        
    }
    
    private func prepareFourthModel(listOfArticles: [Article?]) {
        fourthViewModel = FourthCollectionViewModel(list: listOfArticles)
        
        self.view?.updateTable()

    }
    
    func viewLoaded() {
        getArticles()
        
    }
}
