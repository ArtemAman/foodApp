//
//  RealmInit.swift
//  Fooder
//
//  Created by Artyom Amankeldiev on 17.03.2022.
//

import UIKit
import RealmSwift
import CoreAudio

let realm = try! Realm()


class RealmBase {
    
    enum RequestedModel: String {
        case recipes
        case articles
        
    }
    
    static func saveData<T:Object>(_ object: T) {
        try! realm.write {
            realm.add(object)
        }
    }
    
    static func deleteAll() {
        try! realm.write {
          realm.deleteAll()
        }
    }
    
    static func getAllRecipes() -> Results<RecipeBaseModel> {
        
        let result = realm.objects(RecipeBaseModel.self)
        return result
    }
    
    static func getAllArticles() -> Results<ArticleBaseModel> {
        
        let result = realm.objects(ArticleBaseModel.self)
        return result
    }
    
    static func deleteOne(_ imageUrlString: String, requestedModel: RequestedModel) {
        var result: Object?
        try! realm.write {
            switch requestedModel {
            case .recipes:
                result = realm.objects(RecipeBaseModel.self).filter("imageUrlString = '\(imageUrlString)'").first
            case .articles:
                result = realm.objects(ArticleBaseModel.self).filter("imageUrlString = '\(imageUrlString)'").first
            }
            
            guard let result = result else { return }
            realm.delete(result, cascading: true)
        }
    }
    
    static func checkOneRecipe(_ recipe: RecipeBaseModel) -> Bool {
        
        let result = realm.objects(RecipeBaseModel.self).filter("imageUrlString = '\(recipe.imageUrlString)'")
        return result.count > 0
    }
    
    static func checkOneArticle(_ article: ArticleBaseModel) -> Bool {
        
        let result = realm.objects(ArticleBaseModel.self).filter("imageUrlString = '\(article.imageUrlString)'")
        return result.count > 0
    }
}
