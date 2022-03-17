//
//  FavouriteViewController.swift
//  Fooder
//
//  Created by Artyom Amankeldiev on 14.02.2022.
//


import UIKit

class FavouriteViewController: UIViewController {
    
    var presenter: FavouritePresenter?
    
    private lazy var segmetedControl: UISegmentedControl = {
        let items = ["Favourite recipes", "Favourite articles"]
        let segmented = UISegmentedControl(items: items)
        segmented.translatesAutoresizingMaskIntoConstraints = false
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
}

extension FavouriteViewController: FavouriteViewInput {
    
}

extension FavouriteViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FavouriteViewControllerCell.reuseId, for: indexPath) as! FavouriteViewControllerCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    
}

