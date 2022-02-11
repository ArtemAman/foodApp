//
//  ThirdCollectionView.swift
//  Fooder
//
//  Created by Artyom Amankeldiev on 11.02.2022.
//

import UIKit

class ThirdCollectionView: UICollectionView {
    
//    let cells: PreSetupedTabletsFirst = PreSetupedTabletsFirst()

    
    init() {
        let frame = MainDimensionsCalculator.calculateCVFrame(height: MainVewControllerConstants.thirdCollectionAtributes.itemSize.height)
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.itemSize = MainVewControllerConstants.thirdCollectionAtributes.itemSize
        flowLayout.minimumLineSpacing = MainVewControllerConstants.thirdCollectionAtributes.minimumLineSpacing

        super .init(frame:frame, collectionViewLayout: flowLayout)
        delegate = self
        dataSource = self
        showsVerticalScrollIndicator = false
        showsHorizontalScrollIndicator = false
        register(ThirdCollectionViewCell.self, forCellWithReuseIdentifier: ThirdCollectionViewCell.reuseId)

    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension ThirdCollectionView: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        cells.requestString.count
        12
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: ThirdCollectionViewCell.reuseId, for: indexPath) as! ThirdCollectionViewCell
        
//        cell.setCell(imageName:cells.requestString[indexPath.row], labelText: cells.requestString[indexPath.row])
        return cell
    }
    
    
}
