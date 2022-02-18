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
        labelTitle.text = "leftLabel lef"
        labelTitle.font = .boldSystemFont(ofSize: 12)
        labelTitle.textColor = .black
        labelTitle.textAlignment = .center
        
        return labelTitle
    }()
    
    private lazy var innerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        
        return view
    }()
    
    private lazy var botLabel: UILabel = {
        let labelTitle = UILabel()
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        labelTitle.text = "botLabel botLabel botLabel botLabel"
        labelTitle.font = .systemFont(ofSize: 12)
        labelTitle.textColor = .black
        labelTitle.numberOfLines = 0
        labelTitle.textAlignment = .center
        
        return labelTitle
    }()
    
    init() {
        super.init(frame: .zero)
        backgroundColor = .yellow
        
        setupViews()
        setupConstraints()
        
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
            topLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            topLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            topLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            
            innerView.topAnchor.constraint(equalTo: topLabel.bottomAnchor, constant: 10),
            innerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            innerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            innerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            
            botLabel.topAnchor.constraint(greaterThanOrEqualTo: innerView.topAnchor, constant: 5),
            botLabel.leadingAnchor.constraint(equalTo: innerView.leadingAnchor, constant: 5),
            botLabel.trailingAnchor.constraint(equalTo: innerView.trailingAnchor, constant: -5),
            botLabel.bottomAnchor.constraint(lessThanOrEqualTo: innerView.bottomAnchor, constant: -5),
            botLabel.centerYAnchor.constraint(equalTo: innerView.centerYAnchor)
        ])
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.cornerRadius = 10
        layer.masksToBounds = true
        
        innerView.layer.cornerRadius = 10
        innerView.layer.masksToBounds = true
        
//        layer.shadowRadius = 3
//        layer.shadowOpacity = 0.4
//        layer.shadowOffset = CGSize(width: 1.5, height: 2)
        
    }
    
//    func fill() {
//        titleLabel.text = itemModel.title
//        subtitleLabel.text = itemModel.subtitle
//    }

}
