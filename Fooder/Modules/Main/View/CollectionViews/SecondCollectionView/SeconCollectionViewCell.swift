//
//  FirstCollectionViewCell.swift
//  Fooder
//
//  Created by Artyom Amankeldiev on 10.02.2022.
//

import UIKit

class SecondCollectionViewCell: UICollectionViewCell {
    
    static let reuseId: String = "secondCollectionViewCell"
    

    let layerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    } ()
    
    let botLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.textAlignment = .center
        label.font = MainVewControllerConstants.secondViewLabelFont
        return label
    } ()
    
    
    override init(frame:CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .clear
        self.addSubview(layerView)
        layerView.addSubview(botLabel)
        setConstraints()
    }

    private func setConstraints() {
        NSLayoutConstraint.activate([
            
            layerView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            layerView.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            layerView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            layerView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5),
            
            botLabel.leadingAnchor.constraint(equalTo: layerView.leadingAnchor, constant: 0),
            botLabel.topAnchor.constraint(equalTo: layerView.topAnchor, constant: 0),
            botLabel.trailingAnchor.constraint(equalTo: layerView.trailingAnchor, constant: 0),
            botLabel.bottomAnchor.constraint(equalTo: layerView.bottomAnchor, constant: 0),
            
          ])
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layerView.layer.cornerRadius = 10
        layerView.layer.masksToBounds = true
        
        layer.shadowRadius = 3
        layer.shadowOpacity = 0.4
        layer.shadowOffset = CGSize(width: 1.5, height: 2)
        
    }
    
    func setCell(model:ParamasForSecondCollectionVC? ) {
        guard let model = model else { return }
        botLabel.text = model.webLabel
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
