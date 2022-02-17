//
//  SeventhCollectionView.swift
//  Fooder
//
//  Created by Artyom Amankeldiev on 14.02.2022.
//

import UIKit

class SeventhCollectionView: UICollectionView {
    
    var cells: ReceipViewModel?
    weak var mainVc: DetailCollectionViewCellPressDelegate?
    
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
        register(SeventhCollectionViewCell.self, forCellWithReuseIdentifier: SeventhCollectionViewCell.reuseId)

    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension SeventhCollectionView: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        cells?.cells.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: SeventhCollectionViewCell.reuseId, for: indexPath) as! SeventhCollectionViewCell
        let model = cells?.cells[indexPath.row]
        cell.setCell(model: model)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        mainVc?.makeDetailVc(index: indexPath.row)
      }
    
    
}
