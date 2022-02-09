//
//  ArticlesConfigurator.swift
//  Fooder
//
//  Created by Artyom Amankeldiev on 10.02.2022.
//

import UIKit

final class ArticlesModuleConfigurator {

    // MARK: - Internal methods
    func configure() -> (ArticlesViewController, ArticlesPresenter) {
        let view = ArticlesViewController()
        let presenter = ArticlesPresenter()

        presenter.view = view
        view.presenter = presenter

        return (view, presenter)
    }
}
