//
//  FiffthView.swift
//  Fooder
//
//  Created by Artyom Amankeldiev on 11.02.2022.
//

import UIKit

class FifthView: UIView {
    
    weak var mainVc: RequestWebViewPressDelegate?
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .clear
        imageView.image = UIImage(named: "cooking")
        return imageView
    } ()
    
    private lazy var topLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.text = "We will teach you how to cook like a chef"
        label.font = MainVewControllerConstants.thirdViewLabelFontTop
        return label
    } ()
    
    private lazy var botLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.text = "Cooking courses and masterclasses"
        label.font = MainVewControllerConstants.thirdViewLabelFontBottom
        return label
    } ()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .clear
        self.addSubview(imageView)
        self.addSubview(topLabel)
        self.addSubview(botLabel)
        setConstraints()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(sender:)))
        self.addGestureRecognizer(tapGesture)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func handleTap(sender: UITapGestureRecognizer) {
        mainVc?.makeWebView()
        }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            imageView.widthAnchor.constraint(equalToConstant: 40),
            imageView.heightAnchor.constraint(equalToConstant: 40),
            
            topLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 10),
            topLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            topLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 15),
            topLabel.heightAnchor.constraint(equalToConstant: 20),
            
            botLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 10),
            botLabel.topAnchor.constraint(equalTo: topLabel.bottomAnchor, constant: 3),
            botLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 15),
            botLabel.heightAnchor.constraint(equalToConstant: 20)
            
        ])
    }
}


