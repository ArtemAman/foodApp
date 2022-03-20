//
//  RealmInit.swift
//  Fooder
//
//  Created by Artyom Amankeldiev on 17.03.2022.
//

import UIKit
import RealmSwift

let realm = try! Realm()


class RealmBase {
    
   static func saveData(_ recipe: RecipeBaseModel) {
        try! realm.write {
            realm.add(recipe)
        }
    }
    
    static func deleteAll() {
        try! realm.write {
          realm.deleteAll()
        }
    }
    
    static func getAll() -> Results<RecipeBaseModel> {
        let result = realm.objects(RecipeBaseModel.self)
        return result
    }
    
    static func deleteOne(_ imageUrlString: String) {
        try! realm.write {
            let result = realm.objects(RecipeBaseModel.self).filter("imageUrlString = '\(imageUrlString)'").first
            guard let result = result else { return }
            realm.delete(result, cascading: true)
        }
    }
    
    static func checkOne(_ recipe: RecipeBaseModel) -> Bool {
        
        let result = realm.objects(RecipeBaseModel.self).filter("imageUrlString = '\(recipe.imageUrlString)'")
        if result.count > 0 {
            return true
        } else {
            return false
        }
    }
}
