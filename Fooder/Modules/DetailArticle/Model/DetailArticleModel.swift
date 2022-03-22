//
//  DetailArticleModel.swift
//  Fooder
//
//  Created by Artyom Amankeldiev on 07.03.2022.
//

import UIKit

protocol DetailArticleViewModelProtocol {
    var imageUrlString: String? { get }
    var name: String? { get }
    var articleText: String? { get }
}


struct DetailArticleViewModel: DetailArticleViewModelProtocol {

    var imageUrlString: String?
    var name: String?
    var articleText: String?
    
    init(text: String, cell: FourthCell) {
        self.imageUrlString = cell.imageUrlString
        self.name = cell.name
        self.articleText = text
        
    }
    
    init(articleFromBase: ArticleBaseModel?) {
        self.imageUrlString = articleFromBase?.imageUrlString
        self.name = articleFromBase?.name
        self.articleText = articleFromBase?.articleText
        
    }
}
