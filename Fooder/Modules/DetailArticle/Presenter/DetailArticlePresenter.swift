//
//  DetailArticlePresenter.swift
//  Fooder
//
//  Created by Artyom Amankeldiev on 07.03.2022.
//

import UIKit

class DetailArticlePresenter {
    
    weak var view: DetailArticleInput?
    let articleParser:ArticleParser = ArticleParser()
    var detailArticleModel: DetailArticleViewModelProtocol?
    private var cell: FourthCell
    
    init(articleCell: FourthCell) {
        self.cell = articleCell
    }
    
    private func getArticle(requestingUrl: String) {
        articleParser.scrapeNewsDetail(requestingUrl: requestingUrl) { [weak self] text in
            self?.prepareModel(text: text)
        }
    }
    
    private func prepareModel(text: String?) {
        guard let text = text else { return }
        detailArticleModel = DetailArticleViewModel(text: text, cell: self.cell)
        view?.setupInfo()
        
    }
}

extension DetailArticlePresenter: DetailArticleOutput {
    
    func favourite(ifWeWriteToBase: Bool) {
        guard let detailArticleModel = detailArticleModel else { return }
        if ifWeWriteToBase == true {
            let base = ArticleBaseModel(model: detailArticleModel)
            RealmBase.saveData(base)
        } else {
            RealmBase.deleteOne(detailArticleModel.imageUrlString!, requestedModel: .articles)
        }
    }
    
    func viewLoaded() {
        guard let url = cell.urlToFull else { return }
        getArticle(requestingUrl: url)
    
    }
}
