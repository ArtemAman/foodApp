//
//  Configurator.swift
//  Fooder
//
//  Created by Artyom Amankeldiev on 16.02.2022.
//



import UIKit

final class DetailRecipeModuleConfigurator {

    // MARK: - Internal methods
    func configure(model: CellViewModelProtocol) -> (DetailRecipeViewController, DetailRecipePresenter) {
        let view = DetailRecipeViewController()
        let presenter = DetailRecipePresenter(model: model)

        presenter.view = view
        view.presenter = presenter

        return (view, presenter)
    }
}
