//
//  MainViewController.swift
//  Fooder
//
//  Created by Максим Чикинов on 08.02.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    var presenter: MainViewOutput?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.viewLoaded()
    }
}

extension MainViewController: MainViewInput {
    
}
