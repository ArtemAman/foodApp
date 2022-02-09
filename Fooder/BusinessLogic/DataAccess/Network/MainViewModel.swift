//
//  ReceipModel.swift
//  Fooder
//
//  Created by Artyom Amankeldiev on 09.02.2022.
//

import UIKit

protocol CellViewModelProtocol {
    
    var imageUrlString:String { get }
    var name:String { get }
    
}


struct ReceipViewModel {
    struct Cell: CellViewModelProtocol {
        
        var imageUrlString: String
        var name: String
        var dietLabels:[String]?
        var healthLabels:[String]?
        var cautions:[String]?
        var ingredients:[Ingredient]?
        var totalWeight:Float?
        var cuisineType:[String]?
        var mealType:[String]?
        var dishType:[String]?
 
    }
    
    
    let cells: [Cell]
}

