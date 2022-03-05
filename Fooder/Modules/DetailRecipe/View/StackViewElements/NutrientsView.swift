//
//  NutrientsStackView.swift
//  Fooder
//
//  Created by Artyom Amankeldiev on 17.02.2022.
//


import UIKit


class NutrientView: UIView {
    
    private lazy var outerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .yellow
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
        
        return view
    }()
    
    private lazy var topLabel: UILabel = {
        let labelTitle = UILabel()
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        labelTitle.text = "Nutrient"
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
        labelTitle.text = ""
        labelTitle.font = .systemFont(ofSize: 12)
        labelTitle.textColor = .black
        labelTitle.numberOfLines = 0
        labelTitle.textAlignment = .center
        
        return labelTitle
    }()
    
    init() {
        super.init(frame: .zero)
        
        setupViews()
        setupConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        
        addSubview(outerView)
        
        outerView.addSubview(topLabel)
        outerView.addSubview(innerView)
        
        innerView.addSubview(botLabel)
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            
            outerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            outerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            outerView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            outerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            
            topLabel.leadingAnchor.constraint(equalTo: outerView.leadingAnchor, constant: 5),
            topLabel.trailingAnchor.constraint(equalTo: outerView.trailingAnchor, constant: -5),
            topLabel.topAnchor.constraint(equalTo: outerView.topAnchor, constant: 10),
            
            innerView.topAnchor.constraint(equalTo: topLabel.bottomAnchor, constant: 10),
            innerView.leadingAnchor.constraint(equalTo: outerView.leadingAnchor, constant: 5),
            innerView.trailingAnchor.constraint(equalTo: outerView.trailingAnchor, constant: -5),
            innerView.bottomAnchor.constraint(equalTo: outerView.bottomAnchor, constant: -5),
            
            botLabel.topAnchor.constraint(greaterThanOrEqualTo: innerView.topAnchor, constant: 5),
            botLabel.leadingAnchor.constraint(equalTo: innerView.leadingAnchor, constant: 5),
            botLabel.trailingAnchor.constraint(equalTo: innerView.trailingAnchor, constant: -5),
            botLabel.bottomAnchor.constraint(lessThanOrEqualTo: innerView.bottomAnchor, constant: -5),
            botLabel.centerYAnchor.constraint(equalTo: innerView.centerYAnchor)
        ])
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        

        
        layer.shadowRadius = 3
        layer.shadowOpacity = 0.4
        layer.shadowOffset = CGSize(width: 1.5, height: 2)
        
        innerView.layer.cornerRadius = 10
        innerView.layer.masksToBounds = true
        
    }
    
    func fill(nutrient: Nutrient?) {
        guard let nutrient = nutrient else {
            return
        }
        topLabel.text = nutrient.label
        guard let quantity = nutrient.quantity, let unit = nutrient.unit else { return }
        let normQuantity = String(format: "%.2f", quantity)
       
        botLabel.text = "\(normQuantity) \n \(unit)"
    
    }

}
