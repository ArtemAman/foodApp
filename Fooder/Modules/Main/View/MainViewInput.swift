//
//  MainViewInput.swift
//  Fooder
//
//  Created by Максим Чикинов on 08.02.2022.
//

import Foundation
import UIKit

protocol MainViewInput: AnyObject {
    func updateTable()
    func presentDetailViewController(viewController:UIViewController)
}
