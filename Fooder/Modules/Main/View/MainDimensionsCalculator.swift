//
//  MainDimensionsCalculator.swift
//  Fooder
//
//  Created by Artyom Amankeldiev on 10.02.2022.
//

import UIKit


class MainDimensionsCalculator {
    
    static func calculateCVFrame(height: CGFloat) -> CGRect {
        let collectionFrameWidth = UIScreen.main.bounds.width
        let collectionFrame = CGRect(x: 0, y: MainVewControllerConstants.headersFont.lineHeight, width: collectionFrameWidth, height: height)
        
        return collectionFrame
    }
    
}
