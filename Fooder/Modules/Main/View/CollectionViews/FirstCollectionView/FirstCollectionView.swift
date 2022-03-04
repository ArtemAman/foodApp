//
//  FirstCollectionView.swift
//  Fooder
//
//  Created by Artyom Amankeldiev on 10.02.2022.
//

import UIKit

class FirstCollectionView: UICollectionView {
    
    var cells: PreSetupedTabletsFirst?
    
    weak var mainVc: RequestCollectionViewCellPressDelegate?
    
    init() {
        let frame = MainDimensionsCalculator.calculateCVFrame(height: MainVewControllerConstants.firstCollectionAtributes.itemSize.height)
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.itemSize = MainVewControllerConstants.firstCollectionAtributes.itemSize
        flowLayout.minimumLineSpacing = MainVewControllerConstants.firstCollectionAtributes.minimumLineSpacing

        super .init(frame: frame, collectionViewLayout: flowLayout)
        
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
        let cellsCount = cells?.requestString.count ?? 0
        return cellsCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: FirstCollectionViewCell.reuseId, for: indexPath) as! FirstCollectionViewCell
        let requestString = cells?.requestString[indexPath.row]
        cell.setCell(imageName: requestString,
                     labelText: requestString)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let requestString = cells?.requestString[indexPath.row]
        mainVc?.makeDetailVc(requestString: requestString, requestingType: 1)

    }
}
