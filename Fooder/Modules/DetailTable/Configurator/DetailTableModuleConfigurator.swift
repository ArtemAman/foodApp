//
//  DetailModuleConfigurator.swift
//  Fooder
//
//  Created by Artyom Amankeldiev on 16.02.2022.
//


import UIKit

final class DetailTableModuleConfigurator {

    // MARK: - Internal methods
    func configure() -> (DetailTableViewController, DetailTablePresenter) {
        let view = DetailTableViewController()
        let presenter = DetailTablePresenter()

        presenter.view = view
        view.presenter = presenter

        return (view, presenter)
    }
}
