//
//  DetailViewOutput.swift
//  Fooder
//
//  Created by Artyom Amankeldiev on 16.02.2022.
//

import UIKit
protocol DetailRecipeViewOutput: AnyObject {
    var detailRecipeViewModel: CellViewModelProtocol? { get set }
    func favourite(ifWeWriteToBase: Bool)
    func viewLoaded()
}
