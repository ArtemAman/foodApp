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
    
    private lazy var cautionsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.text = "Cautions"
        label.backgroundColor = .green
        label.numberOfLines = 1
        label.font = MainVewControllerConstants.thirdViewLabelFontTop
        
        return label
    } ()
    
    private lazy var nutrientsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.text = "Nutrients"
        label.backgroundColor = .green
        label.numberOfLines = 1
        label.font = MainVewControllerConstants.thirdViewLabelFontTop
        
        return label
    } ()
    
    private lazy var productsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.text = "Products"
        label.backgroundColor = .green
        label.numberOfLines = 1
        label.font = MainVewControllerConstants.thirdViewLabelFontTop
        
        return label
    } ()
    
    private lazy var dietLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.text = "Diet vibe"
        label.backgroundColor = .green
        label.numberOfLines = 1
        label.font = MainVewControllerConstants.thirdViewLabelFontTop
        
        return label
    } ()
    
    private lazy var healthLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.text = "Health vibe"
        label.backgroundColor = .green
        label.numberOfLines = 1
        label.font = MainVewControllerConstants.thirdViewLabelFontTop
        
        return label
    } ()
    
    private lazy var cautionsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .equalSpacing
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 0
        
        return stackView
    }()
    
    private lazy var nutrientStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.axis = .horizontal
        stackView.spacing = 10
        
        return stackView
    }()
    
    private lazy var productsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .equalSpacing
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 0
        
        return stackView
    }()
    
    private lazy var dietsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 0
        
        return stackView
    }()
    
    private lazy var healthStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 0
        
        return stackView
    }()
    
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
        contentView.addSubview(cautionsLabel)
        contentView.addSubview(cautionsStackView)
        contentView.addSubview(nutrientsLabel)
        contentView.addSubview(nutrientStackView)
        contentView.addSubview(productsLabel)
        contentView.addSubview(productsStackView)
        contentView.addSubview(dietLabel)
        contentView.addSubview(dietsStackView)
        contentView.addSubview(healthLabel)
        contentView.addSubview(healthStackView)
        
        contentView.addSubview(botView)
        
        setupConstraints()
        
        setItemsForCautions()
        setItemsForNutrients()
        setItemsForProducts()
        setItemsForDiet()
        setItemsForHealth()
        
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
            nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 5),
            
            cautionsLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            cautionsLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            cautionsLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            
            cautionsStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            cautionsStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            cautionsStackView.topAnchor.constraint(equalTo: cautionsLabel.bottomAnchor, constant: 10),
            
            nutrientsLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            nutrientsLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            nutrientsLabel.topAnchor.constraint(equalTo: cautionsStackView.bottomAnchor, constant: 10),
            
            nutrientStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            nutrientStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            nutrientStackView.topAnchor.constraint(equalTo: nutrientsLabel.bottomAnchor, constant: 10),
            nutrientStackView.heightAnchor.constraint(equalToConstant: DetailRecipeViewControllerConstants.nutrientsHeight),
            
            productsLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            productsLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            productsLabel.topAnchor.constraint(equalTo: nutrientStackView.bottomAnchor, constant: 10),
            
            productsStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            productsStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            productsStackView.topAnchor.constraint(equalTo: productsLabel.bottomAnchor, constant: 10),
            
            dietLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            dietLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            dietLabel.topAnchor.constraint(equalTo: productsStackView.bottomAnchor, constant: 10),
            
            dietsStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            dietsStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            dietsStackView.topAnchor.constraint(equalTo: dietLabel.bottomAnchor, constant: 10),
            
            healthLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            healthLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            healthLabel.topAnchor.constraint(equalTo: dietsStackView.bottomAnchor, constant: 10),
            
            healthStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            healthStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            healthStackView.topAnchor.constraint(equalTo: healthLabel.bottomAnchor, constant: 10),
            healthStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }
    
    private func setItemsForNutrients() {
        for _ in (0...3) {
            let view = NutrientView()
            nutrientStackView.addArrangedSubview(view)
        }
    }
    
    private func setItemsForProducts() {
        for _ in (0...3) {
            let view = ProductView()
            productsStackView.addArrangedSubview(view)
            
            NSLayoutConstraint.activate([
                view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10)
            ])
        }
    }
    
    private func setItemsForDiet() {
        for _ in (0...3) {
            let view = ProductView()
            dietsStackView.addArrangedSubview(view)
            
            NSLayoutConstraint.activate([
                view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10)
            ])
        }
    }
    
    private func setItemsForHealth() {
        for _ in (0...3) {
            let view = ProductView()
            healthStackView.addArrangedSubview(view)
            
            NSLayoutConstraint.activate([
                view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10)
            ])
        }
    }
    
    private func setItemsForCautions() {
        for _ in (0...3) {
            let view = ProductView()
            cautionsStackView.addArrangedSubview(view)
            
            NSLayoutConstraint.activate([
                view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10)
            ])
        }
    }
    
}

extension DetailRecipeViewController: DetailRecipeViewInput {
    
}
