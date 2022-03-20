//
//  FavouriteOutput.swift
//  Fooder
//
//  Created by Artyom Amankeldiev on 14.02.2022.
//

import UIKit

protocol FavouriteOutput: AnyObject {
    
    var favouriteRecipeModel: ReceipViewModel? { get }
    func viewLoaded()
}
