//
//  DetailArticleViewController.swift
//  Fooder
//
//  Created by Artyom Amankeldiev on 07.03.2022.
//

import UIKit

class DetailArticleViewController: UIViewController {
    
    var presenter: DetailArticleOutput?
    var articleModel: DetailArticleViewModelProtocol?
    var isInBase: Bool = false
    
    private lazy var scroll: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        
        return scroll
    }()
    
    private lazy var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.backgroundColor = .systemGray
        
        return imageView
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.text = ""
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 20, weight: .bold)
        
        return label
    } ()
    
    private lazy var mainTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.text = ""
        label.numberOfLines = 0
        label.font = DetailRecipeViewControllerConstants.nutrientsCollectionTopLabelFont
        
        return label
    } ()
    
    private lazy var likeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemRed
        button.setTitle("Add to favourite", for: .normal)
        button.layer.cornerRadius = 20
        button.layer.masksToBounds = true
        button.titleLabel?.font = DetailRecipeViewControllerConstants.nutrientsCollectionAllLabelsFont
        button.isHidden = true
        button.addTarget(self, action: #selector(saveFavourite), for: .touchUpInside)
        button.startAnimatingPressActions()
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.viewLoaded()
        setupView()
    }
    
    private func setupView() {
        view.backgroundColor = .white
        view.addSubview(scroll)
        scroll.addSubview(contentView)
        
        contentView.addSubview(imageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(mainTextLabel)
        contentView.addSubview(likeButton)

        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            scroll.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            scroll.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            scroll.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            scroll.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            
            contentView.widthAnchor.constraint(equalTo: scroll.widthAnchor),
            contentView.leadingAnchor.constraint(equalTo: scroll.leadingAnchor, constant: 0),
            contentView.topAnchor.constraint(equalTo: scroll.topAnchor, constant: 0),
            contentView.bottomAnchor.constraint(equalTo: scroll.bottomAnchor, constant: 0),
            
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            imageView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width * 0.6),
            
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10),
        
            mainTextLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            mainTextLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            mainTextLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            
            likeButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            likeButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            likeButton.topAnchor.constraint(equalTo: mainTextLabel.bottomAnchor, constant: 10),
            likeButton.heightAnchor.constraint(equalToConstant: 50),
            likeButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
        ])
    }
    
    @objc func saveFavourite(sender: UIButton!) {
        UIView.animate(withDuration: 0.3) {
            self.isInBase = !self.isInBase
            if self.isInBase {
                sender.setTitle("Delete from favourite", for: .normal)
            } else {
                sender.setTitle("Add to favourite", for: .normal)
            }
            self.presenter?.favourite(ifWeWriteToBase: self.isInBase)
        }
    }
    
}

extension DetailArticleViewController: DetailArticleInput{
    
    func setupInfo() {
        articleModel = presenter?.detailArticleModel
        guard let model = articleModel else { return }
        guard let imageName = model.imageUrlString, let url = URL(string: imageName) else { return }
        imageView.kf.setImage(with: url)
        nameLabel.text = model.name
        mainTextLabel.text = model.articleText
        likeButton.isHidden = false
    }
}
