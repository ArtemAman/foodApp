//
//  UIViewController+Extension.swift
//  Fooder
//
//  Created by Максим Чикинов on 08.02.2022.
//

import UIKit

extension UIViewController {
    
    func createNavController(title: String, image: UIImage) -> UIViewController {
        let navController = UINavigationController(rootViewController: self)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        navController.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = title
        
        return navController
    }
    
}
