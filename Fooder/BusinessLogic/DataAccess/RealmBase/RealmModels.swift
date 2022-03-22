//
//  RealmModels.swift
//  Fooder
//
//  Created by Artyom Amankeldiev on 17.03.2022.
//

import UIKit
import RealmSwift


class RecipeBaseModel: Object {
    
    @objc dynamic var imageUrlString: String = ""
    @objc dynamic var name: String = ""
    var dietLabels = List<String>()
    var healthLabels = List<String>()
    var cautions = List<String>()
    var ingredients = List<IngredientBaseModel>()
    @objc dynamic var totalWeight: Float = 0
    var cuisineType = List<String>()
    var mealType = List<String>()
    var dishType = List<String>()
    @objc dynamic var totalNutrients:NutrientsBaseModel? = NutrientsBaseModel(model: nil)

    
    convenience init(model: CellViewModelProtocol) {
        self.init()
        self.imageUrlString = model.imageUrlString ?? ""
        self.name = model.name ?? ""
        model.dietLabels?.forEach({ str in
            self.dietLabels.append(str)
        })
        
        model.healthLabels?.forEach({ str in
            self.healthLabels.append(str)
        })
        
        model.cautions?.forEach({ str in
            self.cautions.append(str)
        })
        
        model.ingredients?.forEach({ ingredient in
            ingredients.append(IngredientBaseModel(model: ingredient))
        })
        
        self.totalWeight = model.totalWeight ?? 0
        model.cuisineType?.forEach({ str in
            self.cuisineType.append(str)
        })
        
        model.mealType?.forEach({ str in
            self.mealType.append(str)
        })
        
        model.dishType?.forEach({ str in
            self.dishType.append(str)
        })
        
        self.totalNutrients = NutrientsBaseModel(model: model.totalNutrients)
    }
}

class IngredientBaseModel: Object {
        
    @objc dynamic var text:String = ""
    @objc dynamic var quantity:Float = 0
    @objc dynamic var measure:String = ""
    @objc dynamic var food:String = ""
    @objc dynamic var weight:Float = 0
    @objc dynamic var foodCategory:String = ""
    @objc dynamic var foodId:String = ""
    @objc dynamic var image:String = ""

    
    convenience init(model: Ingredient) {
        self.init()
        self.text = model.text ?? ""
        self.quantity = model.quantity ?? 0
        self.measure = model.measure ?? ""
        self.food = model.food ?? ""
        self.weight = model.weight ?? 0
        self.foodCategory = model.foodCategory ?? ""
        self.foodId = model.foodId ?? ""
        self.image = model.image ?? ""
        
    }
}

class NutrientsBaseModel: Object {
        
    @objc dynamic var enercKcal:NutrientBaseModel? = NutrientBaseModel(model: nil)
    @objc dynamic var FAT:NutrientBaseModel? = NutrientBaseModel(model: nil)
    @objc dynamic var CHOCDF:NutrientBaseModel? = NutrientBaseModel(model: nil)
    @objc dynamic var PROCNT:NutrientBaseModel? = NutrientBaseModel(model: nil)
    

    convenience init(model: Nutrients?) {
        self.init()
        self.enercKcal = NutrientBaseModel(model: model?.enercKcal)
        self.FAT = NutrientBaseModel(model: model?.FAT)
        self.CHOCDF = NutrientBaseModel(model: model?.CHOCDF ?? nil)
        self.PROCNT = NutrientBaseModel(model: model?.PROCNT ?? nil)
    }
}

class NutrientBaseModel: Object {
        
    @objc dynamic var label:String = ""
    @objc dynamic var quantity:Float = 0
    @objc dynamic var unit:String = ""
    
    convenience init(model: Nutrient?) {
        self.init()
        self.label = model?.label ?? ""
        self.quantity = model?.quantity ?? 0
        self.unit = model?.unit ?? ""
        
    }
}

class ArticleBaseModel: Object {
        
    @objc dynamic var imageUrlString: String = ""
    @objc dynamic var name: String = ""
    @objc dynamic var articleText: String = ""
    
    convenience init(model: DetailArticleViewModelProtocol?) {
        self.init()
        self.imageUrlString = model?.imageUrlString ?? ""
        self.name = model?.name ?? ""
        self.articleText = model?.articleText ?? ""
        
    }
}
