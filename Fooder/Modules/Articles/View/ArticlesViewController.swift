//
//  ArticlesViewController.swift
//  Fooder
//
//  Created by Artyom Amankeldiev on 10.02.2022.
//

import UIKit

class ArticlesViewController: UIViewController {
    
    var presenter: ArticlesPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setupView()
    }
    
    private func setupView() {
        view.backgroundColor = .white
    }
}

extension ArticlesViewController: ArticlesViewInput {
    
}

