//
//  SubviewProtocols.swift
//  Fooder
//
//  Created by Artyom Amankeldiev on 16.02.2022.
//

protocol DetailCollectionViewCellPressDelegate: class {
    
    func makeDetailVc(index:Int)
}


protocol RequestCollectionViewCellPressDelegate: class {
    
    func makeDetailVc(requestString:String?, requestingType: Int)
}
