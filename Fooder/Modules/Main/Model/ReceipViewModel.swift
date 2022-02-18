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
    var dietLabels: [String]? { get }
    var healthLabels: [String]? { get }
    var cautions: [String]? { get }
    var ingredients: [Ingredient]? { get }
    var totalWeight: Float? { get }
    var cuisineType: [String]? { get }
    var mealType: [String]? { get }
    var dishType: [String]? { get }
    var totalNutrients:Nutrients? { get }
}

protocol FourthCellViewModelProtocol {
    var imageUrlString: String? { get }
    var name: String? { get }
    var urlToFull: String? { get }
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
    var totalNutrients: Nutrients?
    
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
        totalNutrients = recipe?.totalNutrients
    }
}



struct MainTableViewModel {
    
    
    var collections: [UIView]
    var heights: [CGFloat]
    var headers:[String]
}

struct PreSetupedTabletsFirst {
    
    var requestString: [String] = ["Asian",
                                   "Italian",
                                   "American",
                                   "British",
                                   "Caribbean",
                                   "Central Europe",
                                   "Chinese",
                                   "Eastern Europe",
                                   "French",
                                   "Indian",
                                   "Japanese",
                                   "Kosher",
                                   "Mediterranean",
                                   "Mexican",
                                   "Middle Eastern",
                                   "Nordic",
                                   "South American",
                                   "South East Asian"]
}


struct PreSetupedTabletsSixth {
    
    var requestString: [String] = ["Breakfast",
                                   "Lunch",
                                   "Dinner",
                                   "Snack",
                                   "Teatime",
                                   ]
}

struct PreSetupedTabletsSecond {
    
    var requestString: [String] = ["balanced",
                                   "high-fiber",
                                   "high-protein",
                                   "low-carb",
                                   "low-fat",
                                   "low-sodium",
                                   ]
}



struct FourthCollectionViewModel {
    
    var cells: [FourthCell] = []
    
    init(list: [Article?]) {
        list.forEach({ article in
            cells.append(FourthCell(article: article))
        })
    }
    
}

struct FourthCell: FourthCellViewModelProtocol {
    
    var imageUrlString: String?
    var name: String?
    var urlToFull: String?
    
    init(article: Article?) {
        self.imageUrlString = article?.imageUrlString
        self.name = article?.name
        self.urlToFull = article?.urlToFull
        
    }
}
