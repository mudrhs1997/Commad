//
//  ViewController.swift
//  Commad
//
//  Created by 정명곤 on 2023/01/17.
//

import UIKit
import SwiftUI

protocol MainDisplayLogic: AnyObject {
    func displaySomething(viewModel: MainModels.Member.ViewModel)
}

enum MainSection: Int, CaseIterable {
    
    case Header
    case MemberList
    
    var description: String {
        switch self {
        case .Header:
            return "메인"
        case .MemberList:
            return "멤버"
        }
    }
}

class MainViewController: UIViewController {
    var interactor: (MainBusinessLogic & MainDataStore)?
    var router: MainRoutingLogic?
    
    var members: [User]?
    
    private let header: MainHeaderView = {
        let header = MainHeaderView()
        header.translatesAutoresizingMaskIntoConstraints = false
        return header
    }()
    
    private let MainCollectionView: UICollectionView = {
        let layout = UICollectionViewCompositionalLayout { (section, _ ) -> NSCollectionLayoutSection? in
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(250))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(250))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
            
            let section = NSCollectionLayoutSection(group: group)
            section.orthogonalScrollingBehavior = .none
            section.contentInsets = .init(top: 50, leading: 16, bottom: 0, trailing: 16)
            
            return section
        }
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        collectionView.register(MainMemberListCollectionViewCell.self, forCellWithReuseIdentifier: MainMemberListCollectionViewCell.identifier)
        
        return collectionView
    }()
    
    private let fetchUser: UIButton = {
        var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.frame = CGRect(origin: .zero, size: .zero)
        button.backgroundColor = .blue
        return button
    }()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        setup()
        interactor?.fetchUsers(request: MainModels.Member.Request(count: 2))
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
        view.backgroundColor = .link
        setupView()
        MainCollectionView.delegate = self
        MainCollectionView.dataSource = self
        
    }
    
}

extension MainViewController: MainDisplayLogic {
    func displaySomething(viewModel: MainModels.Member.ViewModel) {
        DispatchQueue.main.async {
            self.members = viewModel.users
            self.MainCollectionView.reloadData()
        }
    }
}

extension MainViewController {
    private func setupView() {
        self.view.addSubview(header)
        
        header.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        header.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        header.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        header.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        self.view.addSubview(MainCollectionView)

        MainCollectionView.topAnchor.constraint(equalTo: self.header.bottomAnchor, constant: 0).isActive = true
        MainCollectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true
        MainCollectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive = true
        MainCollectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
    }
    
    @objc private func fetchData() {
        interactor?.fetchUsers(request: MainModels.Member.Request(count: 3))
    }
}

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView == self.MainCollectionView {
            let originY: CGFloat = scrollView.contentOffset.y
            let modifiedTopHeight = header.maxHeight - originY
            let height = min(max(modifiedTopHeight, header.minHeight), header.maxHeight)
            
            header.heightAnchor.constraint(equalToConstant: height).isActive = true
            self.view.layoutIfNeeded()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainMemberListCollectionViewCell.identifier, for: indexPath) as? MainMemberListCollectionViewCell else { return UICollectionViewCell() }
        cell.fetchUser(users: self.members)
        
        return cell
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Container().edgesIgnoringSafeArea(.all)
    }
    struct Container: UIViewControllerRepresentable {
        func makeUIViewController(context: Context) -> UIViewController {
            return UINavigationController(rootViewController: MainViewController())
        }
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        }
        typealias  UIViewControllerType = UIViewController
    }
}
