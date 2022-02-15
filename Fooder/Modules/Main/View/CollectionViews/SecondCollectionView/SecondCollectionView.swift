//
//  SecondCollectionView.swift
//  Fooder
//
//  Created by Artyom Amankeldiev on 10.02.2022.
//

//
//  FirstCollectionView.swift
//  Fooder
//
//  Created by Artyom Amankeldiev on 10.02.2022.
//

import UIKit

class SecondCollectionView: UICollectionView {
    
    var cells: PreSetupedTabletsSecond?
    
    init() {
        let collectionFrame = MainDimensionsCalculator.calculateCVFrame(height: MainVewControllerConstants.secondCollectionAtributes.itemSize.height)
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.itemSize = MainVewControllerConstants.secondCollectionAtributes.itemSize
        flowLayout.minimumLineSpacing = MainVewControllerConstants.secondCollectionAtributes.minimumLineSpacing

        super .init(frame: collectionFrame, collectionViewLayout: flowLayout)
        delegate = self
        dataSource = self
        showsVerticalScrollIndicator = false
        showsHorizontalScrollIndicator = false
        register(SecondCollectionViewCell.self, forCellWithReuseIdentifier: SecondCollectionViewCell.reuseId)

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension SecondCollectionView: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let numberOfCells = cells?.tabletString.count ?? 0
        return numberOfCells
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: SecondCollectionViewCell.reuseId, for: indexPath) as! SecondCollectionViewCell
        let model = cells?.tabletString[indexPath.row]
        cell.setCell(model: model)
        return cell
    }
    
    
}

