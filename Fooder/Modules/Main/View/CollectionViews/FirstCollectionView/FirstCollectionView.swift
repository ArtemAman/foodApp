//
//  FirstCollectionView.swift
//  Fooder
//
//  Created by Artyom Amankeldiev on 10.02.2022.
//

import UIKit

class FirstCollectionView: UICollectionView {
    
    let cells: PreSetupedTabletsFirst = PreSetupedTabletsFirst()

    
    init() {
        let frame = MainDimensionsCalculator.calculateCVFrame(height: MainVewControllerConstants.firstCollectionAtributes.itemSize.height)
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.itemSize = MainVewControllerConstants.firstCollectionAtributes.itemSize
        flowLayout.minimumLineSpacing = MainVewControllerConstants.firstCollectionAtributes.minimumLineSpacing

        super .init(frame:frame, collectionViewLayout: flowLayout)
        delegate = self
        dataSource = self
        showsVerticalScrollIndicator = false
        showsHorizontalScrollIndicator = false
        register(FirstCollectionViewCell.self, forCellWithReuseIdentifier: FirstCollectionViewCell.reuseId)

    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension FirstCollectionView: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        cells.requestString.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: FirstCollectionViewCell.reuseId, for: indexPath) as! FirstCollectionViewCell
        
        cell.setCell(imageName:cells.requestString[indexPath.row], labelText: cells.requestString[indexPath.row])
        return cell
    }
    
    
}
