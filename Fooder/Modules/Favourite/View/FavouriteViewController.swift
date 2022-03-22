//
//  FavouriteViewController.swift
//  Fooder
//
//  Created by Artyom Amankeldiev on 14.02.2022.
//


import UIKit

class FavouriteViewController: UIViewController {
    
    var presenter: FavouritePresenter?
    var recipeCells: ReceipViewModel?
    var articleCells: [DetailArticleViewModel]?
    
    private lazy var segmetedControl: UISegmentedControl = {
        let items = ["Favourite recipes", "Favourite articles"]
        let segmented = UISegmentedControl(items: items)
        segmented.translatesAutoresizingMaskIntoConstraints = false
        segmented.selectedSegmentIndex = 0
        segmented.addTarget(self, action: #selector(segmentAction(_:)), for: .valueChanged)
        return segmented
    }()
    
    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.delegate = self
        table.dataSource = self
        table.translatesAutoresizingMaskIntoConstraints = false
//        table.separatorStyle = .none
        table.backgroundColor = .clear
        table.contentInset.top = 8
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        presenter?.viewLoaded()
    }
    
    private func setupView() {
        view.backgroundColor = .white
        view.addSubview(segmetedControl)
        view.addSubview(tableView)
        setupConstraints()
        tableView.register(FavouriteViewControllerCell.self, forCellReuseIdentifier: FavouriteViewControllerCell.reuseId)
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            
            segmetedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            segmetedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            segmetedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            
            tableView.topAnchor.constraint(equalTo: segmetedControl.bottomAnchor, constant: 5),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            
            ])
    
    }
    
    @objc func segmentAction(_ segmentedControl: UISegmentedControl) {
            switch (segmentedControl.selectedSegmentIndex) {
            case 0:
                print("segmented 0")
                tableView.reloadData()
            case 1:
                print("segmented 1")
                tableView.reloadData()
            default:
                break
            }
    }
}

extension FavouriteViewController: FavouriteViewInput {
    func updateTable() {
        recipeCells = presenter?.favouriteRecipeModel
        articleCells = presenter?.favouriteArticleModel
        tableView.reloadData()
    }
    
    
}

extension FavouriteViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch (segmetedControl.selectedSegmentIndex) {
        case 0:
            return recipeCells?.cells.count ?? 0
        case 1:
            return articleCells?.count ?? 0
        default:
            return 0
            
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FavouriteViewControllerCell.reuseId, for: indexPath) as! FavouriteViewControllerCell
        switch (segmetedControl.selectedSegmentIndex) {
        case 0:
            let recipeModel = recipeCells?.cells[indexPath.row]
            let model = FavouriteCell(recipe: recipeModel)
            cell.setCell(model: model)
            return cell
        case 1:
            let articleModel = articleCells?[indexPath.row]
            let model = FavouriteCell(article: articleModel)
            cell.setCell(model: model)
            return cell
        default:
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    
}

