//
//  MainVewControllerConstants.swift
//  Fooder
//
//  Created by Artyom Amankeldiev on 10.02.2022.
//

import UIKit

struct CollectionAttribute {
    
    var itemSize:CGSize
    var minimumLineSpacing:CGFloat
}

struct MainVewControllerConstants {
    
    static let firstVClabelfont = UIFont.systemFont(ofSize: 14, weight: .bold)
    static let headersFont = UIFont.systemFont(ofSize: 24, weight: .bold)
    static let secondViewLabelFont = UIFont.systemFont(ofSize: 18, weight: .semibold)
    static let thirdViewLabelFont = UIFont.systemFont(ofSize: 14, weight: .regular)
    static let numberOfItemsFirstCollection = 8
    
    // change smth with insets
    static let collectionInsets = UIEdgeInsets(top: 20,
                                               left: 0,
                                               bottom: 5,
                                               right: 0)
    
    // collection atributes
    static let firstCollectionAtributes = CollectionAttribute(
        itemSize: CGSize(width: UIScreen.main.bounds.height / 7, height: UIScreen.main.bounds.height / 7),
        minimumLineSpacing: 15)
    
    static let secondCollectionAtributes = CollectionAttribute(
        itemSize: CGSize(width: UIScreen.main.bounds.height / 5, height: 30),
        minimumLineSpacing: 15)
    
    static let thirdCollectionAtributes = CollectionAttribute(
        itemSize: CGSize(width: UIScreen.main.bounds.height / 4, height: UIScreen.main.bounds.height / 5),
        minimumLineSpacing: 15)
    
    static let fifthViewHeight: CGFloat = 50
    
    
    
    
    
//    static let bottomFont = UIFont.systemFont(ofSize: 15)
//    static let nameFont = UIFont.systemFont(ofSize: 14)
//    static let dateFont = UIFont.systemFont(ofSize: 10)
//    static let topViewHeight: CGFloat = 36
//    static let bottomViewHeight:CGFloat = 44
//    static let bottomViewElementWidth:CGFloat = 74
//    static let kitHeight:CGFloat = 15
//
//    static let postMinLinesToShowButton:CGFloat = 8
//    static let postMinLinesShowedByButton:CGFloat = 6
//
//    static let cardViewInsets: UIEdgeInsets = UIEdgeInsets(top: 0, left: 8, bottom: 12, right: 8)
//    static let postLabelInsets: UIEdgeInsets = UIEdgeInsets(top: 8 + CellConstants.topViewHeight + 8 , left: 8, bottom: 8, right: 8)
//
//    static let moreTexButtonSize:CGSize = CGSize(width: 170, height: 30)
    
}


