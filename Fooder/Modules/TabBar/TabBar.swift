//
//  TabBar.swift
//  Fooder
//
//  Created by Максим Чикинов on 08.02.2022.
//

import UIKit

class TabBar: UITabBarController {
    
    private let mainModule = MainModuleConfigurator().configure()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupVCs()
    }
    
    func setupVCs() {
        let mainViewController = mainModule.0
        
        viewControllers = [
            mainViewController.createNavController(title: "Главная",
                                                   image: UIImage(systemName: "house.circle")!)
        ]
    }
    
}
