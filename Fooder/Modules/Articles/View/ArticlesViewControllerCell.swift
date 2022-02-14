//
//  ArticlesViewControllerCell.swift
//  Fooder
//
//  Created by Artyom Amankeldiev on 14.02.2022.
//


import UIKit

class ArrticleVCTableViewCell: UITableViewCell {
    
    static let reuseId = "ArticleCell"
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        cellSet()
    }
    
    
    
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
        label.font = ArticlesViewControllerConstants.lableArticleFont
        return label
    } ()
    
    func cellSet() {
        
        self.addSubview(imageArticle)
        self.addSubview(labelArticle)
        setConstraints()
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        imageArticle.layer.cornerRadius = 10
        imageArticle.layer.masksToBounds = true
        
        imageArticle.layer.shadowRadius = 3
        imageArticle.layer.shadowOpacity = 0.4
        imageArticle.layer.shadowOffset = CGSize(width: 3, height: 2)
        
    }

    private func setConstraints() {
        NSLayoutConstraint.activate([
            
            imageArticle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            imageArticle.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            imageArticle.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            imageArticle.heightAnchor.constraint(equalToConstant: ArticlesViewControllerConstants.imageHeight),
           
            

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
