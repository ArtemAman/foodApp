//
//  ProductView.swift
//  Fooder
//
//  Created by Artyom Amankeldiev on 17.02.2022.
//


import UIKit


class ProductView: UIView {
    
    private lazy var leftLabel: UILabel = {
        let labelTitle = UILabel()
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        labelTitle.text = "leftLabel leftLabel"
        labelTitle.font = .boldSystemFont(ofSize: 12)
        labelTitle.textColor = .black
        labelTitle.textAlignment = .center
        
        return labelTitle
    }()
    
    private lazy var rightLabel: UILabel = {
        let labelTitle = UILabel()
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        labelTitle.text = "botLabel botLabel"
        labelTitle.font = .systemFont(ofSize: 12)
        labelTitle.textColor = .black
        labelTitle.numberOfLines = 0
        labelTitle.textAlignment = .center
        
        return labelTitle
    }()
    
    private lazy var layerView: UIView = {
        let view = UIView()
        
        return view
    }()
    
    private lazy var dividerView: UIView = {
        let dividerView = UIView()
        dividerView.backgroundColor = UIColor.black.withAlphaComponent(0.05)
        
        return dividerView
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
        
        addSubview(leftLabel)
        addSubview(rightLabel)
//        addSubview(dividerView)
        
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            
            leftLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            leftLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5),
//            leftLabel.heightAnchor.constraint(equalToConstant: 25),
            
            leftLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),

            rightLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            rightLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5),
//            rightLabel.heightAnchor.constraint(equalToConstant: 25),
            rightLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            
//            dividerView.heightAnchor.constraint(equalToConstant: 1),
//            dividerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
//            dividerView.leftAnchor.constraint(equalTo: leftAnchor, constant: 0),
//            dividerView.rightAnchor.constraint(equalTo: rightAnchor, constant: 0),
            
            
            
        ])
    }
    
//    func fill() {
//        titleLabel.text = itemModel.title
//        subtitleLabel.text = itemModel.subtitle
//    }

}
