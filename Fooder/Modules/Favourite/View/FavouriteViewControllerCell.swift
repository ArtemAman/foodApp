//
//  FavouriteViewControllerCell.swift
//  Fooder
//
//  Created by Artyom Amankeldiev on 15.02.2022.
//


import UIKit

class FavouriteViewControllerCell: UITableViewCell {
    
    static let reuseId = "FavouriteCell"
    
    private lazy var imageFavourite: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .systemGray
        return imageView
    } ()
    
    private lazy var imageLike: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .clear
        imageView.image = UIImage(systemName: "arrow.clockwise.heart.fill")?.withTintColor(.red, renderingMode: .alwaysOriginal)
        return imageView
    } ()

    
    private lazy var labelFavourite: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.numberOfLines = 0
        label.text = "OloloOloloOloloOloloOloloOloloOloloOloloOloloOloloOloloOloloOloloOloloOloloOloloOloloOloloOlolofdgdgdgdgfdfdfdfegfergergergerger"
        label.font = ArticlesViewControllerConstants.lableArticleFont
        return label
    } ()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        layoutSet()
    }
    
    func layoutSet() {
        
        self.addSubview(imageFavourite)
        self.addSubview(labelFavourite)
        self.addSubview(imageLike)
        setConstraints()
        
    }
    
//    func setCell(model: FourthCell?) {
//        guard let model = model else { return }
//        guard let imageName = model.imageUrlString, let url = URL(string: imageName) else { return }
//        imageArticle.kf.setImage(with: url)
//        guard let labelText = model.name else { return }
//        labelArticle.text = labelText
//
//    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        imageFavourite.layer.cornerRadius = 10
        imageFavourite.layer.masksToBounds = true
        
        
    }

    private func setConstraints() {
        NSLayoutConstraint.activate([
            
            imageFavourite.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            imageFavourite.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            imageFavourite.widthAnchor.constraint(equalToConstant: FavouriteViewControllerConstants.imageWidth),
            imageFavourite.heightAnchor.constraint(equalToConstant: FavouriteViewControllerConstants.imageHeight),
           
            labelFavourite.leadingAnchor.constraint(equalTo: imageFavourite.trailingAnchor, constant: 5),
            labelFavourite.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            labelFavourite.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            labelFavourite.heightAnchor.constraint(equalToConstant: FavouriteViewControllerConstants.imageHeight - 30),
            
            
            imageLike.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            imageLike.topAnchor.constraint(equalTo: labelFavourite.bottomAnchor, constant: 5),
            imageLike.heightAnchor.constraint(equalToConstant: 25),
            imageLike.widthAnchor.constraint(equalToConstant: 25),
            
            
          ])
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
