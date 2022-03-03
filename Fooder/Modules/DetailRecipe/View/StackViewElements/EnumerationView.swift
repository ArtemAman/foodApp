//
//  EnumerationView.swift
//  Fooder
//
//  Created by Artyom Amankeldiev on 03.03.2022.
//

import UIKit


class EnumerationView: UIView {
    
    private lazy var leftLabel: UILabel = {
        let labelTitle = UILabel()
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        labelTitle.text = "leftLabel leftLabel"
        labelTitle.font = .boldSystemFont(ofSize: 12)
        labelTitle.textColor = .black
        labelTitle.textAlignment = .center
        
        return labelTitle
    }()
    
    private lazy var layerView: UIView = {
        let view = UIView()
        
        return view
    }()
    
    private lazy var dividerView: UIView = {
        let dividerView = UIView()
        dividerView.translatesAutoresizingMaskIntoConstraints = false
        dividerView.backgroundColor = UIColor.black.withAlphaComponent(0.05)
        
        return dividerView
    }()
    
    init() {
        super.init(frame: .zero)
        
        setupViews()
        setupConstraints()
        
//        fill()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        
        addSubview(leftLabel)
        addSubview(dividerView)
        
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            
            leftLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            leftLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            leftLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),

            
            dividerView.heightAnchor.constraint(equalToConstant: 1),
            dividerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            dividerView.leftAnchor.constraint(equalTo: leftAnchor, constant: 0),
            dividerView.rightAnchor.constraint(equalTo: rightAnchor, constant: 0),
            
            
            
        ])
    }
    
    func fill(labelText: String) {
        leftLabel.text = labelText
        
    }

}
