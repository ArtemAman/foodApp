//
//  ArticlesViewController.swift
//  Fooder
//
//  Created by Artyom Amankeldiev on 10.02.2022.
//

import UIKit

class ArticlesViewController: UIViewController {
    
    var presenter: ArticlesPresenter?
    
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
    }
    
    private func setupView() {
        view.backgroundColor = .white
        view.addSubview(tableView)
        setupConstraints()
        tableView.register(ArrticleVCTableViewCell.self, forCellReuseIdentifier: ArrticleVCTableViewCell.reuseId)
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

extension ArticlesViewController: ArticlesViewInput {
    
}

extension ArticlesViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ArrticleVCTableViewCell.reuseId, for: indexPath) as! ArrticleVCTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let height = ArticlesViewControllerConstants.imageHeight + (ArticlesViewControllerConstants.lableArticleFont.lineHeight * 2) + 15
        
        return height
    }
    
    
}

