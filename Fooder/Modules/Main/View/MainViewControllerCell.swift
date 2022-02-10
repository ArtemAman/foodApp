//
//  MainViewControllerCell.swift
//  Fooder
//
//  Created by Artyom Amankeldiev on 10.02.2022.
//

import UIKit

class MainVCTableViewCell: UITableViewCell {
    
    static let reuseId = "MainCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    func cellSet(collection: UICollectionView) {
        self.addSubview(collection)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
