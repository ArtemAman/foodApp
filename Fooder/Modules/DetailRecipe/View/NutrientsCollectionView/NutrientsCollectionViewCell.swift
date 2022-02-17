//
//  NutrientsCollectionViewCell.swift
//  Fooder
//
//  Created by Artyom Amankeldiev on 17.02.2022.
//

import UIKit

class NutrientsCollectionViewCell: UICollectionViewCell {
    
    static let reuseId: String = "nutrientsCollectionViewCell"
    
//    var mainVc: DetailCollectionViewCellPressDelegate?
    let topLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.text = "label"
        label.textAlignment = .center
        label.font = DetailRecipeViewControllerConstants.nutrientsCollectionLabelFont
        return label
    } ()
    
    let insideView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    } ()
    
    let botLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.text = "label"
        label.font = DetailRecipeViewControllerConstants.nutrientsCollectionLabelFont
        return label
    } ()
    
    override init(frame:CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .yellow
        
        self.addSubview(topLabel)
        self.addSubview(insideView)
        insideView.addSubview(botLabel)
        setConstraints()
    }
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            
            topLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            topLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            topLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
//            topLabel.heightAnchor.constraint(equalToConstant: DetailRecipeViewControllerConstants.nutrientsCollectionLabelFont.lineHeight),

            
            insideView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            insideView.topAnchor.constraint(equalTo: topLabel.bottomAnchor, constant: 5),
            insideView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
            insideView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5),
            
            botLabel.centerXAnchor.constraint(equalTo: insideView.centerXAnchor),
            botLabel.centerYAnchor.constraint(equalTo: insideView.centerYAnchor),
            
            
        ])
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        
        layer.cornerRadius = 10
        layer.masksToBounds = true

        layer.shadowRadius = 3
        layer.shadowOpacity = 0.4
        layer.shadowOffset = CGSize(width: 1.5, height: 2)
        
    }
    
    func setCell(imageName: String?, labelText: String?) {
//        guard let imageName = imageName, let url = URL(string: imageName) else { return }
//        imageView.kf.setImage(with: url)
//        guard let labelText = labelText else { return }
//        botLabel.text = labelText
//        guard let imageName = imageName else { return }
//        imageView.image = UIImage(named: imageName)
//        guard let labelText = labelText else { return }
//        botLabel.text = labelText
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
