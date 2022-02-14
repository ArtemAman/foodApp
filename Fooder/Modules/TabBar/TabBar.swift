//
//  TabBar.swift
//  Fooder
//
//  Created by Максим Чикинов on 08.02.2022.
//

import UIKit

class TabBar: UITabBarController {
    
    private let mainModule = MainModuleConfigurator().configure()
    private let articleModule = ArticlesModuleConfigurator().configure()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupVCs()
    }
    
    func setupVCs() {
        let mainViewController = mainModule.0
        let articleViewController = articleModule.0
        
        viewControllers = [
            mainViewController.createNavController(title: "Main",
                                                   image: UIImage(systemName: "house.circle")!),
            articleViewController.createNavController(title: "Everything about cooking",
                                                   image: UIImage(systemName: "book.circle")!)
        ]
    }
    
}
