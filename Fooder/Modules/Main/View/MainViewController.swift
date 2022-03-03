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
    private lazy var sixthCollection = SixthCollectionView()
    private lazy var seventhCollection = SeventhCollectionView()
    
    var cells: MainTableViewModel?
    
    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.delegate = self
        table.dataSource = self
        table.translatesAutoresizingMaskIntoConstraints = false
        table.backgroundColor = .clear
        table.separatorStyle = .none
        table.register(MainVCTableViewCell.self, forCellReuseIdentifier: MainVCTableViewCell.reuseId)
        
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.viewLoaded()
        
        firstCollection.mainVc = self
        secondCollection.mainVc = self
        thirdCollection.mainVc = self
        fourthCollection.mainVc = self
        sixthCollection.mainVc = self
        seventhCollection.mainVc = self
        
        
        let headers = ["Foreign kitchens",
                       "Diets",
                       "Random receips",
                       "Smth interesting about cooking",
                       "",
                       "Dishes",
                       "Random products"
        ]
        
        let collections = [firstCollection,
                           secondCollection,
                           thirdCollection,
                           fourthCollection,
                           fifthCollection,
                           sixthCollection,
                           seventhCollection]
        
        let collectionHeights = [MainVewControllerConstants.firstHeight,
                                 MainVewControllerConstants.secondHeight,
                                 MainVewControllerConstants.thirdHeight,
                                 MainVewControllerConstants.fourthHeight,
                                 MainVewControllerConstants.fifthViewHeight,
                                 MainVewControllerConstants.sixthHeight,
                                 MainVewControllerConstants.seventhHeight]
        
        cells = MainTableViewModel(collections: collections, heights: collectionHeights, headers: headers)
        
        setupView()
        
//        HUD.show(.labeledProgress(title: "Загрузка", subtitle: "в процессе..."), onView: self.view)
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
    
    
    func presentDetailRecipe(viewController: UIViewController) {
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    
    func updateTable() {
        firstCollection.cells = presenter?.firstViewModel
        firstCollection.reloadData()
        
        secondCollection.cells = presenter?.secondViewModel
        secondCollection.reloadData()
        
        thirdCollection.cells = presenter?.thirdViewModel
        thirdCollection.reloadData()
        
        fourthCollection.cells = presenter?.fourthViewModel
        fourthCollection.reloadData()
        
        sixthCollection.cells = presenter?.sixthViewModel
        sixthCollection.reloadData()
        
        seventhCollection.cells = presenter?.thirdViewModel
        seventhCollection.reloadData()
        
//        HUD.show(.labeledSuccess(title: "Загрузка", subtitle: "завершена"), onView: self.view)
//        HUD.hide(afterDelay: 1, completion: nil)
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cells?.collections.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MainVCTableViewCell.reuseId, for: indexPath) as! MainVCTableViewCell
        if let cellView = cells?.collections[indexPath.row] {
            cell.cellSet(collection: cellView)
        }
        if let cellText = cells?.headers[indexPath.row] {
            cell.labelSet(text: cellText)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let cellSize = cells?.heights[indexPath.row] else { return 0 }
        return cellSize
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRow(at: indexPath as IndexPath, animated: true)
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

    }
    
}


extension MainViewController: DetailCollectionViewCellPressDelegate {
    
    func makeDetailVc(index: Int) {
        presenter?.configureDetailRecipeViewController(cellIndex: index)
    }
}

extension MainViewController: RequestCollectionViewCellPressDelegate {
    
    func makeDetailVc(requestString: String?) {
        
        presenter?.configureDetailTableViewController(requestingString: requestString)
    }
    
    
    
}
