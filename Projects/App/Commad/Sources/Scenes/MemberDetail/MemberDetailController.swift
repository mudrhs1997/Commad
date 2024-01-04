//
//  MemberDetailViewController.swift
//  Commad
//
//  Created by 정명곤 on 2023/08/15.
//

import UIKit

final class MemberDetailController: UIViewController {
    enum Section: Int {
        case month
        case day
    }
    
    struct Item: Hashable {
        let data: Any
        let identifier: UUID
        
        init(data: Any, identifier: UUID = UUID()) {
            self.data = data
            self.identifier = identifier
        }
        
        func hash(into hasher: inout Hasher) {
            hasher.combine(self.identifier)
        }
        
        static func == (lhs: Item, rhs: Item) -> Bool {
            lhs.identifier == rhs.identifier
        }
    }
    
    typealias DataSource = UICollectionViewDiffableDataSource<Section, Item>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Section, Item>
    
    private lazy var dataSource: DataSource = configureDataSource()
    private lazy var snapshot: Snapshot = Snapshot()
    
    var interactor: (MemberDetailBusinessLogic & MemberDetailDataStore)?
    var router: (MemberDetailRoutingLogic & MemberDetailDataPassing)?
    
    var member: Member?
    
    let headerView = MemberDetailHeader()
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewCompositionalLayout { section, _ in
            return Layouts.History.allCases[section].section()
        }
        
        let collectionView = UICollectionView(frame: CGRect(origin: .zero, size: .zero), collectionViewLayout: layout)
        collectionView.showsVerticalScrollIndicator = false
        
        return collectionView
    }()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        setup()
//        interactor.doSomething(request: MemberDetailModels.History.Request(member: member))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        collectionView.dataSource = dataSource
        collectionView.delegate = self
        registerCell()
        setupView()
        snapshot.appendSections([.month, .day])
        snapshot.appendItems([Item(data: "")], toSection: .month)
        self.dataSource.apply(self.snapshot)
    }
    
    private func setup() {
        let viewController = self
        let interactor = MemberDetailInteractor()
        let presenter = MemberDetailPresenter()
        let router = MemberDetailRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    
    private func registerCell() {
        collectionView.register(CollectionViewHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CollectionViewHeader.identifier)
        collectionView.register(MemberHistoryCell.self, forCellWithReuseIdentifier: MemberHistoryCell.identifier)
    }
    
    private func configureDataSource() -> DataSource {
        let dataSource = DataSource(collectionView: self.collectionView) { collectionView, indexPath, item in
            guard let section = Section(rawValue: indexPath.section) else { return UICollectionViewCell() }
            switch section {
            case .month:
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MemberHistoryCell.identifier, for: indexPath) as? MemberHistoryCell else { return UICollectionViewCell() }
                cell.configureCell(day: Int.random(in: 1...31))
                return cell
                
            case .day:
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MemberHistoryCell.identifier, for: indexPath) as? MemberHistoryCell else { return UICollectionViewCell() }
                cell.configureCell(day: 999)
                return cell
            }
        }
        
        configureHeader(of: dataSource)
        return dataSource
    }
    
    private func configureHeader(of dataSource: DataSource) {
        dataSource.supplementaryViewProvider = { collectionView, kind, indexPath in
            let section = self.dataSource.snapshot().sectionIdentifiers[indexPath.section]
            let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                       withReuseIdentifier: CollectionViewHeader.identifier,
                                                                       for: indexPath) as? CollectionViewHeader
            switch section {
            case .month:
                view?.configureCell(title: "12월")
            case .day:
                view?.configureCell(title: "11월")
            }
            
            return view
        }
    }
    
}

extension MemberDetailController {
    private func setupView() {
        view.addSubview(headerView)
        headerView.exitButton.addTarget(self, action: #selector(toggleButton), for: .touchUpInside)
        headerView.nameLabel.text = interactor?.member?.name
        headerView.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(350)
        }
        
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(headerView.snp.bottom)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
    }
    
    @objc func toggleButton() {
        dismiss(animated: true)
    }
}

extension MemberDetailController: UICollectionViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView == self.collectionView {
            let originY: CGFloat = scrollView.contentOffset.y
            let modifiedTopHeight = headerView.maxHeight - originY
            let height = min(max(modifiedTopHeight, headerView.minHeight), headerView.maxHeight)
            
            headerView.snp.updateConstraints { make in
                make.height.equalTo(height)
            }
            
            self.view.layoutIfNeeded()
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
}
