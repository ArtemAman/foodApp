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
    
    static let firstVClabelfont = UIFont.systemFont(ofSize: 14, weight: .semibold)
    static let numberOfItemsFirstCollection = 8
    static let firstCollectionAtributes = CollectionAttribute(
        itemSize: CGSize(width: 150, height: 150),
        minimumLineSpacing: 15)
    
    static let collectionInsets = UIEdgeInsets(top: 10,
                                               left: 0,
                                               bottom: 10,
                                               right: 0)
    
    
    
    
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


