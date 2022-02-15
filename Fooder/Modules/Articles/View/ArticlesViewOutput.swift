//
//  ArticlesViewOutput.swift
//  Fooder
//
//  Created by Artyom Amankeldiev on 10.02.2022.
//

import UIKit
protocol ArticlesViewOutput: AnyObject {
    
    var fourthViewModel: FourthCollectionViewModel? { get set }
    
    func viewLoaded()
}
