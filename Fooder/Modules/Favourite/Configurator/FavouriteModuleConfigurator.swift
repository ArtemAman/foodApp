//
//  FavouriteModuleConfigurator.swift
//  Fooder
//
//  Created by Artyom Amankeldiev on 14.02.2022.
//

import UIKit

final class FavouriteModuleConfigurator {

    // MARK: - Internal methods
    func configure() -> (SearchViewController, SearchPresenter) {
        let view = SearchViewController()
        let presenter = SearchPresenter()

        presenter.view = view
        view.presenter = presenter

        return (view, presenter)
    }
}
