//
//  MemberDetailViewController.swift
//  Commad
//
//  Created by 정명곤 on 2023/08/15.
//

import UIKit

protocol MemberDetailDisplayLogic: AnyObject {
    func displayHistories(viewModel: MemberDetailModels.MemberHistory.ViewModel)
    func displayCheckInAlert(viewModel: MemberDetailModels.CheckIn.ViewModel)
}

final class MemberDetailController: UIViewController {
    var interactor: (MemberDetailBusinessLogic & MemberDetailDataStore)?
    var router: (MemberDetailRoutingLogic & MemberDetailDataPassing)?
    
    private var year: String?
    private var month: String?
    private var histories: [History]?
 
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
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        collectionView.dataSource = self
        collectionView.delegate = self
        registerCell()
        setupView()
        setDate()
        fetchMemberHistory()
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
    
    private func setDate() {
        let date = Date()
        year = date.getToday(type: .year)
        month = date.getToday(type: .month)
    }
    
    
    private func registerCell() {
        collectionView.register(CollectionViewHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CollectionViewHeader.identifier)
        collectionView.register(MemberHistoryCell.self, forCellWithReuseIdentifier: MemberHistoryCell.identifier)
    }
    
    private func fetchMemberHistory() {
        if let year = year, let month = month {
            interactor?.fetchMemberHistory(request: MemberDetailModels.MemberHistory.Request(year: year, month: month))
        }
    }
    
}

extension MemberDetailController {
    private func setupView() {
        view.addSubview(headerView)
        headerView.checkInButton.addTarget(self, action: #selector(tapCheckInButton), for: .touchUpInside)
        headerView.exitButton.addTarget(self, action: #selector(tapExitButton), for: .touchUpInside)
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
    
    @objc func tapExitButton() {
        dismiss(animated: true)
    }
    
    @objc func tapCheckInButton() {
        interactor?.checkIn(request: MemberDetailModels.CheckIn.Request())
    }
}

extension MemberDetailController: MemberDetailDisplayLogic {
    func displayCheckInAlert(viewModel: MemberDetailModels.CheckIn.ViewModel) {
        DispatchQueue.main.async {
            self.histories?.append(viewModel.history)
            self.headerView.exitButton.backgroundColor = .gray
            self.collectionView.reloadData()
        }
    }
    
    func displayHistories(viewModel: MemberDetailModels.MemberHistory.ViewModel) {
        DispatchQueue.main.async {
            self.histories = viewModel.histories
//            self.headerView.exitButton.isEnabled = false
            self.collectionView.reloadData()
        }
    }
}

extension MemberDetailController: UICollectionViewDelegate, UICollectionViewDataSource {
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
        return histories?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CollectionViewHeader.identifier, for: indexPath) as? CollectionViewHeader else { return UICollectionReusableView() }
        header.configure(title: self.month ?? "")
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let history = histories?[indexPath.row].historyDate,
              let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MemberHistoryCell.identifier, for: indexPath) as? MemberHistoryCell else { return UICollectionViewCell() }
        
        cell.configureCell(day: history)
        
        return cell
    }
    
}
