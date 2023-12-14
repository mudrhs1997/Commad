//
//  ViewController.swift
//  Commad
//
//  Created by 정명곤 on 2023/01/17.
//

import UIKit
import SwiftUI
import SnapKit

protocol MainDisplayLogic: AnyObject {
    func displaySomething(viewModel: MainModels.Members.ViewModel)
}

class HomeController: UIViewController {
    var interactor: (MainBusinessLogic & MainDataStore)?
    var router: MainRoutingLogic?
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewCompositionalLayout { (section, _ ) -> NSCollectionLayoutSection? in
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.3))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
            
            let section = NSCollectionLayoutSection(group: group)
            section.orthogonalScrollingBehavior = .none
            section.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 0)
            
            return section
        }
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        collectionView.register(HomeButtonCell.self, forCellWithReuseIdentifier: HomeButtonCell.identifier)
        
        return collectionView
    }()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        setup()
        interactor?.fetchUsers(request: MainModels.Members.Request(count: 2))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        let viewController = self
        let interactor = MainInteractor()
        let presenter = MainPresenter()
        let router = MainRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupView()
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }
    
}

extension HomeController: MainDisplayLogic {
    func displaySomething(viewModel: MainModels.Members.ViewModel) {
        DispatchQueue.main.async {
//            self.members = viewModel.members
//            self.MainCollectionView.reloadData()
        }
    }
}

extension HomeController {
    private func setupView() {
        
        self.view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    @objc private func showMemberList() {
        router?.routeToDetail()
    }
}

extension HomeController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeButtonCell.identifier, for: indexPath) as? HomeButtonCell else { return UICollectionViewCell() }
        
        cell.configureCell(title: MainModels.Title.allCases[indexPath.row].rawValue)
        return cell
    }
    
}
