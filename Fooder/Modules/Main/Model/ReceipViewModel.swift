//
//  ReceipViewModel.swift
//  Fooder
//
//  Created by Artyom Amankeldiev on 09.02.2022.
//

import UIKit

protocol CellViewModelProtocol {
    var imageUrlString: String? { get }
    var name: String? { get }
}

struct ReceipViewModel {
    
    var cells: [Cell] = []
    
    init(list: RecipeResponse?) {
        list?.hits?.forEach({ hit in
            cells.append(Cell(recipe: hit.recipe))
        })
    }
    
}

struct Cell: CellViewModelProtocol {
    var imageUrlString: String?
    var name: String?
    var dietLabels: [String]?
    var healthLabels: [String]?
    var cautions: [String]?
    var ingredients: [Ingredient]?
    var totalWeight: Float?
    var cuisineType: [String]?
    var mealType: [String]?
    var dishType: [String]?
    
    init(recipe: Recipe?) {
        imageUrlString = recipe?.image
        name = recipe?.label
        dietLabels = recipe?.dietLabels
        healthLabels = recipe?.healthLabels
        cautions = recipe?.cautions
        ingredients = recipe?.ingredients
        totalWeight = recipe?.totalWeight
        cuisineType = recipe?.cuisineType
        mealType = recipe?.mealType
        dishType = recipe?.dishType
    }
}