//
//  DetailViewController.swift
//  Fooder
//
//  Created by Artyom Amankeldiev on 16.02.2022.
//

import UIKit



class DetailRecipeViewController: UIViewController {
    
    var presenter: DetailRecipePresenter?
    var recipeInfo: CellViewModelProtocol?
    var dietLabels: [String]?
    var healthLabels: [String]?
    var cautions: [String]?
    var ingredients: [Ingredient]?
    var nutrients: Nutrients?
    
    
    
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
        label.text = "Article name top"
        label.backgroundColor = .clear
        label.numberOfLines = 2
        label.font = DetailRecipeViewControllerConstants.nutrientsCollectionTopLabelFont
        
        return label
    } ()
    
    private lazy var cautionsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.text = "Cautions"
        label.font = DetailRecipeViewControllerConstants.nutrientsCollectionAllLabelsFont
        
        return label
    } ()
    
    private lazy var nutrientsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.text = "Nutrients"
        label.font = DetailRecipeViewControllerConstants.nutrientsCollectionAllLabelsFont
        
        return label
    } ()
    
    private lazy var productsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.text = "Products"
        label.font = DetailRecipeViewControllerConstants.nutrientsCollectionAllLabelsFont
        
        return label
    } ()
    
    private lazy var dietLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.text = "Diet vibe"
        label.font = DetailRecipeViewControllerConstants.nutrientsCollectionAllLabelsFont
        
        return label
    } ()
    
    private lazy var healthLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.text = "Health vibe"
        label.font = DetailRecipeViewControllerConstants.nutrientsCollectionAllLabelsFont
        
        return label
    } ()
    
    private lazy var moreButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .clear
        button.setTitle("Show more +", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 12)
        button.addTarget(self, action: #selector(moreButtonAction), for: .touchUpInside)
        return button
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
        stackView.distribution = .fill
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.spacing = 0
        
        return stackView
    }()
    
    private lazy var dietsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fill
        stackView.axis = .vertical
        stackView.spacing = 0
        
        return stackView
    }()
    
    private lazy var healthStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fill
        stackView.axis = .vertical
        stackView.spacing = 0
        
        return stackView
    }()
    
    private lazy var productsButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemGreen
        button.setTitle("Buy necessary products", for: .normal)
        button.titleLabel?.font = DetailRecipeViewControllerConstants.nutrientsCollectionAllLabelsFont
        
        return button
    }()
    
    private lazy var likeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemRed
        button.setTitle("Add to favourite", for: .normal)
        button.titleLabel?.font = DetailRecipeViewControllerConstants.nutrientsCollectionAllLabelsFont
        
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
        contentView.addSubview(cautionsLabel)
        contentView.addSubview(cautionsStackView)
        contentView.addSubview(nutrientsLabel)
        contentView.addSubview(nutrientStackView)
        contentView.addSubview(productsLabel)
        contentView.addSubview(productsStackView)
        contentView.addSubview(dietLabel)
        contentView.addSubview(dietsStackView)
        contentView.addSubview(healthLabel)
        contentView.addSubview(moreButton)
        contentView.addSubview(healthStackView)
        contentView.addSubview(productsButton)
        contentView.addSubview(likeButton)
        
        setupConstraints()
        layoutSubviews()
        
        setImage()
    
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
            
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10),
            
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
            healthLabel.topAnchor.constraint(equalTo: dietsStackView.bottomAnchor, constant: 10),
            
            moreButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            moreButton.topAnchor.constraint(equalTo: dietsStackView.bottomAnchor, constant: 10),
            
            healthStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            healthStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            healthStackView.topAnchor.constraint(equalTo: healthLabel.bottomAnchor, constant: 10),
            
            productsButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            productsButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            productsButton.topAnchor.constraint(equalTo: healthStackView.bottomAnchor, constant: 10),
            productsButton.heightAnchor.constraint(equalToConstant: 50),
            
            likeButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            likeButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            likeButton.topAnchor.constraint(equalTo: productsButton.bottomAnchor, constant: 10),
            likeButton.heightAnchor.constraint(equalToConstant: 50),
            likeButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            
        ])
    }
    
    private func layoutSubviews() {
        
        productsButton.layer.cornerRadius = 20
        productsButton.layer.masksToBounds = true
        
        likeButton.layer.cornerRadius = 20
        likeButton.layer.masksToBounds = true
        
    }
    
    private func setImage() {
        guard let imageName = recipeInfo?.imageUrlString, let url = URL(string: imageName) else { return }
        imageView.kf.setImage(with: url)
    }
    
    private func setItemsForNutrients() {
        guard let nutrients = nutrients else { return }
        for elem in (0...3) {
            switch elem {
            case 0:
                let view = NutrientView()
                view.fill(nutrient: nutrients.enercKcal)
                nutrientStackView.addArrangedSubview(view)
            case 1:
                let view = NutrientView()
                view.fill(nutrient: nutrients.PROCNT)
                nutrientStackView.addArrangedSubview(view)
            case 2:
                let view = NutrientView()
                view.fill(nutrient: nutrients.FAT)
                nutrientStackView.addArrangedSubview(view)
            case 3:
                let view = NutrientView()
                view.fill(nutrient: nutrients.CHOCDF)
                nutrientStackView.addArrangedSubview(view)
            default:
                let view = NutrientView()
                nutrientStackView.addArrangedSubview(view)
            }
            
        }
    }
    
    private func setItemsForProducts() {
        guard let ingredients = ingredients else { return }
        for ingredient in ingredients {
            let view = ProductView()
            view.fill(ingredient: ingredient)
            productsStackView.addArrangedSubview(view)
        }
    }
    
    private func setItemsForDiet() {
        guard let dietLabels = dietLabels else {
            return
        }
        if dietLabels.count == 0 {
            
            let view = EnumerationView()
            view.fill(labelText: "no diet labels")
            dietsStackView.addArrangedSubview(view)
            
        } else {
            
            for text in dietLabels {
                let view = EnumerationView()
                view.fill(labelText: text)
                dietsStackView.addArrangedSubview(view)
                
            }
        }
    }
    
    private func setItemsForHealth() {
        guard let healthLabels = healthLabels else {
            return
        }
        var counter = 0
        for text in healthLabels {
            let view = EnumerationView()
            view.fill(labelText: text)
            healthStackView.addArrangedSubview(view)
            if counter >= 5 {
                view.isHidden = true
            }
            counter += 1
            
        }
    }
    
    @objc func moreButtonAction(sender: UIButton!) {
        var counter = 0
        UIView.animate(withDuration: 0.3) {
                self.healthStackView.arrangedSubviews.forEach { view in
                    if counter >= 5 {
                        view.alpha = view.isHidden ? 1 : 0
                        view.isHidden = view.isHidden ? false : true
                    }
                    counter += 1
                }
            }
       }
    
    private func setItemsForCautions() {
        
        guard let cautions = cautions else { return }
        
        if cautions.count == 0 {
            let view = EnumerationView()
            view.fill(labelText: "No cautions in this recipe")
            cautionsStackView.addArrangedSubview(view)
            
            NSLayoutConstraint.activate([
                view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10)
            ])
        } else {
            for text in cautions {
                let view = EnumerationView()
                view.fill(labelText: text)
                cautionsStackView.addArrangedSubview(view)
                
                NSLayoutConstraint.activate([
                    view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10)
                ])
            }
        }
    }
}

extension DetailRecipeViewController: DetailRecipeViewInput {

    func setupInfo() {
        recipeInfo = presenter?.detailRecipeViewModel
        guard let recipeInfo = recipeInfo else { return }
        nameLabel.text = recipeInfo.name
        dietLabels = recipeInfo.dietLabels
        healthLabels = recipeInfo.healthLabels
        cautions = recipeInfo.cautions
        ingredients = recipeInfo.ingredients
        nutrients = recipeInfo.totalNutrients
    }
}
