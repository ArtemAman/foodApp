//
//  FourthCollectionViewCell.swift
//  Fooder
//
//  Created by Artyom Amankeldiev on 11.02.2022.
//

import UIKit

class FourthCollectionViewCell: UICollectionViewCell {
    
    static let reuseId: String = "fourthCollectionViewCell"
    

    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .systemGray
        return imageView
    } ()
    
    let botLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.text = "Article name bot"
        label.font = MainVewControllerConstants.thirdViewLabelFont
        return label
    } ()
    
    
    override init(frame:CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .clear
        self.addSubview(imageView)
        self.addSubview(botLabel)
        setConstraints()
    }

    private func setConstraints() {
        NSLayoutConstraint.activate([
            
 

            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            imageView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.7),
            
            botLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            botLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            botLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 5),
            botLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5),
        
          ])
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        imageView.layer.cornerRadius = 10
        imageView.layer.masksToBounds = true
        
        layer.shadowRadius = 3
        layer.shadowOpacity = 0.4
        layer.shadowOffset = CGSize(width: 1.5, height: 2)
        
    }
    
    func setCell(imageName:String?, labelText:String?) {
        guard let imageName = imageName else { return }
        imageView.image = UIImage(named: imageName)
        guard let labelText = labelText else { return }
        botLabel.text = labelText
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}