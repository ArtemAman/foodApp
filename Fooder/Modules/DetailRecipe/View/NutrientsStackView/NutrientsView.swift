//
//  NutrientsStackView.swift
//  Fooder
//
//  Created by Artyom Amankeldiev on 17.02.2022.
//


import UIKit


class NutrientView: UIView {
    
    
    private lazy var topLabel: UILabel = {
        let labelTitle = UILabel()
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        labelTitle.text = "leftLabel"
        labelTitle.font = .boldSystemFont(ofSize: 5)
        labelTitle.textColor = .black
        
        return labelTitle
    }()
    
    private lazy var innerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var botLabel: UILabel = {
        let labelTitle = UILabel()
        labelTitle.text = "rightLabel"
        labelTitle.font = .systemFont(ofSize: 5)
        labelTitle.textColor = .black
        return labelTitle
    }()
    
    
    init() {
        super.init(frame: .zero)
        setupViews()
        setupConstraints()
        backgroundColor = .yellow
        
//        fill()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        addSubview(topLabel)
        addSubview(innerView)
        
        innerView.addSubview(botLabel)
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([

            topLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            topLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
            topLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            
            innerView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            innerView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
            innerView.topAnchor.constraint(equalTo: topLabel.bottomAnchor, constant: 5),
            innerView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5),
            
            botLabel.centerXAnchor.constraint(equalTo: innerView.centerXAnchor),
            botLabel.centerYAnchor.constraint(equalTo: innerView.centerYAnchor),
            
          ])
    }
    
//    func fill() {
//        titleLabel.text = itemModel.title
//        subtitleLabel.text = itemModel.subtitle
//    }

}
