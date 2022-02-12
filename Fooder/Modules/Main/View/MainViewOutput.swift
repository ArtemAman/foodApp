//
//  MainViewOutput.swift
//  Fooder
//
//  Created by Максим Чикинов on 08.02.2022.
//

import Foundation

protocol MainViewOutput: AnyObject {
    var firstViewModel: ReceipViewModel? { get set }
    func viewLoaded()
}
