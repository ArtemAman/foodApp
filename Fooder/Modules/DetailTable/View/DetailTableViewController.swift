//
//  DetailTableViewController.swift
//  Fooder
//
//  Created by Artyom Amankeldiev on 16.02.2022.
//

import UIKit



class DetailTableViewController: UIViewController {
    
    var presenter: DetailTablePresenter?
    var cells: ReceipViewModel?
    
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
        presenter?.viewLoaded()
        setupView()
    }
    
    private func setupView() {
        view.backgroundColor = .white
        view.addSubview(tableView)
        setupConstraints()
        tableView.register(DetailTableViewControllerCell.self, forCellReuseIdentifier: DetailTableViewControllerCell.reuseId)
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            
            ])
    }
}

extension DetailTableViewController: DetailTableViewInput {
    func updateTable() {
        cells = presenter?.recipeViewModel
        tableView.reloadData()
    }
    
    
}

extension DetailTableViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let cellsCount = cells?.cells.count ?? 0
        return cellsCount
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DetailTableViewControllerCell.reuseId, for: indexPath) as! DetailTableViewControllerCell
        
        let model = cells?.cells[indexPath.row]
        cell.setCell(model: model)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let height = ArticlesViewControllerConstants.imageHeight + (ArticlesViewControllerConstants.lableArticleFont.lineHeight * 2) + 15
        
        return height
    }
    
    
}


