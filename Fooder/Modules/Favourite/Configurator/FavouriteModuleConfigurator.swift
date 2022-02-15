//
//  FavouriteModuleConfigurator.swift
//  Fooder
//
//  Created by Artyom Amankeldiev on 14.02.2022.
//

import UIKit

final class FavouriteModuleConfigurator {

    // MARK: - Internal methods
    func configure() -> (FavouriteViewController, FavouritePresenter) {
        let view = FavouriteViewController()
        let presenter = FavouritePresenter()

        presenter.view = view
        view.presenter = presenter

        return (view, presenter)
    }
}
