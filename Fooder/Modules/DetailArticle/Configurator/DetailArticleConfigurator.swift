//
//  DetailArticleConfigurator.swift
//  Fooder
//
//  Created by Artyom Amankeldiev on 07.03.2022.
//


import UIKit

final class DetailArticleConfigurator {

    // MARK: - Internal methods
    func configure(articleCell: FourthCell) -> (DetailArticleViewController, DetailArticlePresenter){
        let view = DetailArticleViewController()
        let presenter = DetailArticlePresenter(articleCell: articleCell)

        presenter.view = view
        view.presenter = presenter

        return (view, presenter)
    }
}
