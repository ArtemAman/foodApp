//
//  NutrientsCollectionViewController.swift
//  Fooder
//
//  Created by Artyom Amankeldiev on 17.02.2022.
//

import UIKit

class NutrientCollectionView: UICollectionView {
    
//    var cells: PreSetupedTabletsFirst?
    
//    weak var mainVc: RequestCollectionViewCellPressDelegate?
    
    init() {
        let frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width - 20, height: DetailRecipeViewControllerConstants.itemSize.height)
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.itemSize = DetailRecipeViewControllerConstants.itemSize
        flowLayout.minimumLineSpacing = DetailRecipeViewControllerConstants.minimumLineSpacing

        super .init(frame: frame, collectionViewLayout: flowLayout)
        
        self.backgroundColor = .clear
        
        delegate = self
        dataSource = self
        
        showsVerticalScrollIndicator = false
        showsHorizontalScrollIndicator = false
        
        register(NutrientsCollectionViewCell.self, forCellWithReuseIdentifier: NutrientsCollectionViewCell.reuseId)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension NutrientCollectionView: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: NutrientsCollectionViewCell.reuseId, for: indexPath) as! NutrientsCollectionViewCell
        return cell
    }
    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let requestString = cells?.requestString[indexPath.row]
//        mainVc?.makeDetailVc(requestString: requestString)
//
//    }
}
