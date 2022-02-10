//
//  FirstCollectionView.swift
//  Fooder
//
//  Created by Artyom Amankeldiev on 10.02.2022.
//

import UIKit

class FirstCollectionView: UICollectionView {
    
    let numberOfItems:Int
    
    init(itemSize:CGSize, minimumLineSpacing: CGFloat, numberOfItems: Int) {
        self.numberOfItems = numberOfItems
        let collectionFrame = FirstCollectionView.dimentionsCalculator(itemSize: itemSize)
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.itemSize = itemSize
        flowLayout.minimumLineSpacing = minimumLineSpacing

        super .init(frame: collectionFrame, collectionViewLayout: flowLayout)
        delegate = self
        dataSource = self
        showsVerticalScrollIndicator = false
        showsHorizontalScrollIndicator = false
        register(FirstCollectionViewCell.self, forCellWithReuseIdentifier: FirstCollectionViewCell.reuseId)
    }
    
    static func dimentionsCalculator(itemSize:CGSize) -> CGRect {
        
        let collectionFrameWidth = UIScreen.main.bounds.width - (MainVewControllerConstants.collectionInsets.top + MainVewControllerConstants.collectionInsets.bottom)
        let collectionFrame = CGRect(x: 0, y: 0, width: collectionFrameWidth, height: itemSize.height + MainVewControllerConstants.collectionInsets.top + MainVewControllerConstants.collectionInsets.bottom)
        
        return collectionFrame
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension FirstCollectionView: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.numberOfItems
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: FirstCollectionViewCell.reuseId, for: indexPath) as! FirstCollectionViewCell
        cell.setCell(imageName:"asian", labelText: "Asian")
        return cell
    }
    
    
}
