//
//  TabBar.swift
//  Fooder
//
//  Created by Максим Чикинов on 08.02.2022.
//

import UIKit

class TabBar: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupVCs()
    }
    
    func setupVCs() {
        viewControllers = [
            MainViewController().createNavController(title: "Главная",
                                                     image: UIImage(systemName: "house.circle")!)
        ]
    }
    
}
