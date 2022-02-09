//
//  ResponseReceipt.swift
//  Fooder
//
//  Created by Artyom Amankeldiev on 09.02.2022.
//

import Foundation
import CoreText



struct ReceiptResponse: Decodable {
    
    var from:Int
    var to:Int
    var count:Int
    var _links: Links
    var hits: [Hit]
    
}

struct Links: Decodable {
    
    var selfLink: Link?
    var next:Link?
    
    enum CodingKeys: String, CodingKey {
        
       case selfLink = "self"
       case next
    }
}




struct Link: Decodable {

    var href:String
    var title:String

}

struct Hit: Decodable {

    var recipe:Recipe
    var _links:Links

}

struct Recipe: Decodable {

    var label:String
    var image:String
    var source:String
    var dietLabels:[String]?
    var healthLabels:[String]?
    var cautions:[String]?
    var ingredientLines:[String]?
    var ingredients:[Ingredient]
    var totalWeight:Float
    var cuisineType:[String]
    var mealType:[String]
    var dishType:[String]
    var totalNutrients:Nutrients
    var totalDaily:Nutrients

}

struct Ingredient: Decodable {

    var text:String
    var quantity:Float
    var measure:String?
    var food:String
    var weight:Float
    var foodCategory:String?
    var foodId:String
    var image:String?

}

struct Nutrients: Decodable {

    var energy:Nutrient?
    var fat:Nutrient
    var chocdf:Nutrient
    var sugar:Nutrient?
    var procnt:Nutrient
    
    enum CodingKeys: String, CodingKey {
        
       case energy = "ENERC_KCAL" // smth wrong with json for key totalDaily
       case fat = "FAT"
       case chocdf = "CHOCDF"
       case sugar = "SUGAR"
       case procnt = "PROCNT"
    }

}

struct Nutrient: Decodable {

    var label:String?
    var quantity:Float?
    var unit:String?

}


