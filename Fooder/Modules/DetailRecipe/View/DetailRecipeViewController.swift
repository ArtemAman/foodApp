//
//  DetailViewController.swift
//  Fooder
//
//  Created by Artyom Amankeldiev on 16.02.2022.
//

import UIKit



class DetailRecipeViewController: UIViewController {
    
    var presenter: DetailRecipePresenter?
    
    
    private lazy var scroll: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.backgroundColor = .lightGray
        return scroll
    }()
    
    private lazy var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemBlue
        return view
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .systemPink
        return imageView
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.text = "Article name top"
        label.backgroundColor = .green
        label.numberOfLines = 2
        label.font = MainVewControllerConstants.thirdViewLabelFontTop
        return label
    } ()
    
    private lazy var botView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemRed
        return view
    }()
    
    
    private lazy var nutrientView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()
    
    let nutrientCollection = NutrientCollectionView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    
    private func setupView() {
        view.backgroundColor = .white
        view.addSubview(scroll)
        scroll.addSubview(contentView)
        
        
        contentView.addSubview(imageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(nutrientView)
        contentView.addSubview(botView)
        
        nutrientView.addSubview(nutrientCollection)
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
            imageView.heightAnchor.constraint(equalToConstant: DetailRecipeViewControllerConstants.imageHeight),
                        
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 300),

            nutrientView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            nutrientView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            nutrientView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            nutrientView.heightAnchor.constraint(equalToConstant: DetailRecipeViewControllerConstants.itemSize.height),
            
            botView.topAnchor.constraint(equalTo: nutrientView.bottomAnchor, constant: 10),
            botView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            botView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            botView.heightAnchor.constraint(equalToConstant: 30),
            botView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),


            
            ])
    }
}

extension DetailRecipeViewController: DetailRecipeViewInput {
    
}




