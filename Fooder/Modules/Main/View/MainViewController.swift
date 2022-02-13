//
//  MainViewController.swift
//  Fooder
//
//  Created by Максим Чикинов on 08.02.2022.
//

import UIKit
import PKHUD

class MainViewController: UIViewController {
    
    var presenter: MainViewOutput?
    
    private lazy var firstCollection = FirstCollectionView()
    private lazy var secondCollection = SecondCollectionView()
    private lazy var thirdCollection = ThirdCollectionView()
    private lazy var fourthCollection = FourthCollectionView()
    private lazy var fifthCollection = FifthView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width - 20, height: MainVewControllerConstants.fifthViewHeight))
    
    var cells: TableViewModel?
    
    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.delegate = self
        table.dataSource = self
        table.translatesAutoresizingMaskIntoConstraints = false
        table.backgroundColor = .clear
        table.register(MainVCTableViewCell.self, forCellReuseIdentifier: MainVCTableViewCell.reuseId)
        
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.viewLoaded()
        
        let collections = [firstCollection,
                           secondCollection,
                           thirdCollection,
                           fourthCollection,
                           fifthCollection]
        
        let collectionHeights = [MainVewControllerConstants.firstHeight,
                                 MainVewControllerConstants.secondHeight,
                                 MainVewControllerConstants.thirdHeight,
                                 MainVewControllerConstants.fourthHeight,
                                 MainVewControllerConstants.fifthViewHeight]
        
        cells = TableViewModel(collections: collections, heights: collectionHeights)
        
        setupView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        HUD.show(.labeledProgress(title: "Загрузка", subtitle: "в процессе..."), onView: self.view)
    }
    
    private func setupView() {
        view.backgroundColor = .white
        
        view.addSubview(tableView)
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
    }
}

extension MainViewController: MainViewInput {
    func updateTable() {
        firstCollection.cells = presenter?.firstViewModel
        firstCollection.reloadData()
        
        HUD.show(.labeledSuccess(title: "Загрузка", subtitle: "завершена"), onView: self.view)
        HUD.hide(afterDelay: 1, completion: nil)
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cells?.collections.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MainVCTableViewCell.reuseId, for: indexPath) as! MainVCTableViewCell
        cell.backgroundColor = .green
        if let cellModel = cells?.collections[indexPath.row] {
            cell.cellSet(collection: cellModel)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let cellSize = cells?.heights[indexPath.row] else { return 0 }
        return cellSize
    }
    
}
