//
//  MainModuleConfigurator.swift
//  Fooder
//
//  Created by Максим Чикинов on 08.02.2022.
//

import UIKit

final class MainModuleConfigurator {

    // MARK: - Internal methods
    func configure() -> (MainViewController, MainPresenter) {
        let view = MainViewController()
        let presenter = MainPresenter()

        presenter.view = view
        view.presenter = presenter

        return (view, presenter)
    }
}
