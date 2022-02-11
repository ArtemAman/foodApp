//
//  MainViewController.swift
//  Fooder
//
//  Created by Максим Чикинов on 08.02.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    var presenter: MainViewOutput?
    
   
    let firstCollection = FirstCollectionView()
    let secondCollection = SecondCollectionView()
    let thirdCollection = ThirdCollectionView()
    let fourthCollection = FourthCollectionView()
    let fifthCollection = FifthView(frame: MainDimensionsCalculator.calculateCVFrame(height: MainVewControllerConstants.fifthViewHeight))
      

    var cells: CellsModel?
    
    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.delegate = self
        table.dataSource = self
        table.translatesAutoresizingMaskIntoConstraints = false
//        table.separatorStyle = .none
        table.backgroundColor = .clear
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        presenter?.viewLoaded()

        let firstHeight = MainDimensionsCalculator.cellHeightCalculator(height: MainVewControllerConstants.firstCollectionAtributes.itemSize.height)
        let secondHeight = MainDimensionsCalculator.cellHeightCalculator(height: MainVewControllerConstants.secondCollectionAtributes.itemSize.height)
        let thirdHeight = MainDimensionsCalculator.cellHeightCalculator(height: MainVewControllerConstants.thirdCollectionAtributes.itemSize.height)
        let fourthHeight = MainDimensionsCalculator.cellHeightCalculator(height: MainVewControllerConstants.thirdCollectionAtributes.itemSize.height)
        
        
        cells = CellsModel(collection: [firstCollection,
                                        secondCollection,
                                        thirdCollection,
                                        fourthCollection,
                                        fifthCollection],
                           
                           height:[firstHeight,
                                   secondHeight,
                                   thirdHeight,
                                   fourthHeight,
                                   MainVewControllerConstants.fifthViewHeight,
                                  ])
        setupView()
    }
    
    private func setupView() {
        
        view.backgroundColor = .white
        view.addSubview(tableView)
        setupConstraints()
        tableView.register(MainVCTableViewCell.self, forCellReuseIdentifier: MainVCTableViewCell.reuseId)

    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            
            ])
        
    }
}

extension MainViewController: MainViewInput {
    
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        (cells?.collection.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MainVCTableViewCell.reuseId, for: indexPath) as! MainVCTableViewCell
        cell.backgroundColor = .green
        cell.cellSet(collection: (cells?.collection[indexPath.row])!)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let cellSize = (cells?.height[indexPath.row])!
        return cellSize
    }
    
    
}
