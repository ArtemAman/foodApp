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
        
        setupView()
    }
    
    private func setupView() {
        view.backgroundColor = .white
    }
}

extension MainViewController: MainViewInput {
    
}
