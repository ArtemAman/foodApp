//
//  FirstCollectionView.swift
//  Fooder
//
//  Created by Artyom Amankeldiev on 10.02.2022.
//

import UIKit

class SixthCollectionView: UICollectionView {
    
    var cells: ReceipViewModel?
    
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
        
        register(SixthCollectionViewCell.self, forCellWithReuseIdentifier: SixthCollectionViewCell.reuseId)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension SixthCollectionView: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        cells?.cells.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: SixthCollectionViewCell.reuseId, for: indexPath) as! SixthCollectionViewCell
        let model = cells?.cells[indexPath.row]
        cell.setCell(imageName: model?.imageUrlString,
                     labelText: model?.name)
        return cell
    }
    
}
