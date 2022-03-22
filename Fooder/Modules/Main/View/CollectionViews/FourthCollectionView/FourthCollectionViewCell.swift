//
//  FourthCollectionViewCell.swift
//  Fooder
//
//  Created by Artyom Amankeldiev on 11.02.2022.
//

import UIKit

class FourthCollectionViewCell: UICollectionViewCell {
    
    static let reuseId: String = "fourthCollectionViewCell"
    
    
    private lazy var outerView: UIView = {
        let view = UIView()
        view.clipsToBounds = false
        view.layer.shadowRadius = 3
        view.layer.shadowOpacity = 0.4
        view.layer.shadowOffset = CGSize(width: 1.5, height: 2)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()

    private lazy var imageView: WebImageView = {
        let imageView = WebImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .systemGray
        return imageView
    } ()
    
    private lazy var botLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.text = "Article name bot"
        label.numberOfLines = 2
        label.font = MainVewControllerConstants.thirdViewLabelFontTop
        return label
    } ()
    
    
    override init(frame:CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .clear
       
        self.addSubview(outerView)
        self.addSubview(botLabel)
        outerView.addSubview(imageView)
        
        setConstraints()
    }

    private func setConstraints() {
        NSLayoutConstraint.activate([
            
            outerView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            outerView.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            outerView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            outerView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.65),
            
            imageView.leadingAnchor.constraint(equalTo: outerView.leadingAnchor, constant: 0),
            imageView.topAnchor.constraint(equalTo: outerView.topAnchor, constant: 0),
            imageView.trailingAnchor.constraint(equalTo: outerView.trailingAnchor, constant: 0),
            imageView.bottomAnchor.constraint(equalTo: outerView.bottomAnchor, constant: 0),
            
            botLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            botLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            botLabel.topAnchor.constraint(equalTo: outerView.bottomAnchor, constant: 5),
            botLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5),
    
          ])
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        imageView.layer.cornerRadius = 10
        imageView.layer.masksToBounds = true
        
    }
    
    func setCell(model: FourthCell?) {
        guard let model = model else { return }
        guard let imageUrlString = model.imageUrlString else { return }
        imageView.set(imageURL: imageUrlString)
        guard let labelText = model.name else { return }
        botLabel.text = labelText
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
