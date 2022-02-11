//
//  MainDimensionsCalculator.swift
//  Fooder
//
//  Created by Artyom Amankeldiev on 10.02.2022.
//

import UIKit


class MainDimensionsCalculator {
    

    
    static func calculateCVFrame(height: CGFloat) -> CGRect {
        
        let collectionFrameWidth = UIScreen.main.bounds.width - (MainVewControllerConstants.collectionInsets.top + MainVewControllerConstants.collectionInsets.bottom)
        let collectionFrame = CGRect(x: 0, y: MainVewControllerConstants.collectionInsets.top, width: collectionFrameWidth, height: height + MainVewControllerConstants.collectionInsets.bottom + MainVewControllerConstants.collectionInsets.bottom)
        
        return collectionFrame
    }
    
    static func cellHeightCalculator(height: CGFloat) -> CGFloat {
        let height = height + MainVewControllerConstants.collectionInsets.bottom + MainVewControllerConstants.headersFont.lineHeight
        return height
    }
    
}
