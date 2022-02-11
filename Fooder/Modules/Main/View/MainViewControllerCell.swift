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
    
    let topLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.text = "Ololo"
        label.font = MainVewControllerConstants.headersFont
        return label
    } ()
    
    func cellSet(collection: UIView) {
        
        self.addSubview(collection)
        
        if collection is UICollectionView {
            self.addSubview(topLabel)
            setConstraints()
        } else {
        
        }
        
        
        
    }

    private func setConstraints() {
        NSLayoutConstraint.activate([

            topLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            topLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            topLabel.heightAnchor.constraint(equalToConstant: 20),
            topLabel.widthAnchor.constraint(equalTo: self.widthAnchor),

          ])
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
