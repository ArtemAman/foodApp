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
    
   static func saveData(_ place: RecipeBaseModel) {
        try! realm.write {
            realm.add(place)
        }
    }
    
    static func deleteAll() {
        try! realm.write {
          realm.deleteAll()
        }
    }
}
