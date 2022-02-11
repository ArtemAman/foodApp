




import UIKit

class FourthCollectionView: UICollectionView {
    
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
        register(FourthCollectionViewCell.self, forCellWithReuseIdentifier: FourthCollectionViewCell.reuseId)

    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension FourthCollectionView: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        cells.requestString.count
        12
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: FourthCollectionViewCell.reuseId, for: indexPath) as! FourthCollectionViewCell
        
//        cell.setCell(imageName:cells.requestString[indexPath.row], labelText: cells.requestString[indexPath.row])
        return cell
    }
    
    
}
