//
//  DetailTableViewControllerCell.swift
//  Fooder
//
//  Created by Artyom Amankeldiev on 16.02.2022.
//

import UIKit

class DetailTableViewControllerCell: UITableViewCell {
    
    static let reuseId = "DetailTableCell"
    
    private lazy var outerView: UIView = {
        let view = UIView()
        view.clipsToBounds = false
        view.layer.shadowRadius = 3
        view.layer.shadowOpacity = 0.4
        view.layer.shadowOffset = CGSize(width: 1.5, height: 2)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private lazy var imageArticle: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .systemGray
        return imageView
    } ()

    private lazy var labelArticle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.text = "Ololo"
        label.font = DetailTableViewControllerConstants.lableArticleFont
        return label
    } ()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        layoutSet()
    }
    
    func layoutSet() {
        
        self.addSubview(outerView)
        self.addSubview(labelArticle)
        outerView.addSubview(imageArticle)
    
        setConstraints()
        
    }
    
    func setCell(model: CellViewModelProtocol?) {
        guard let model = model else { return }
        guard let imageName = model.imageUrlString, let url = URL(string: imageName) else { return }
        imageArticle.kf.setImage(with: url)
        guard let labelText = model.name else { return }
        labelArticle.text = labelText
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        imageArticle.layer.cornerRadius = 10
        imageArticle.layer.masksToBounds = true
        
    }

    private func setConstraints() {
        NSLayoutConstraint.activate([
            
            outerView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            outerView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            outerView.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            outerView.heightAnchor.constraint(equalToConstant: DetailTableViewControllerConstants.imageHeight),
            
            imageArticle.leadingAnchor.constraint(equalTo: outerView.leadingAnchor, constant: 0),
            imageArticle.trailingAnchor.constraint(equalTo: outerView.trailingAnchor, constant: 0),
            imageArticle.topAnchor.constraint(equalTo: outerView.topAnchor, constant: 0),
            imageArticle.bottomAnchor.constraint(equalTo: outerView.bottomAnchor, constant: 0),
           
            labelArticle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            labelArticle.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            labelArticle.topAnchor.constraint(equalTo: imageArticle.bottomAnchor, constant: 5),
            labelArticle.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5),
            
          ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
