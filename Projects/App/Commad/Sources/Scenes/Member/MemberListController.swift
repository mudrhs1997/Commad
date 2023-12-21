//
//  MemberDetailViewController.swift
//  Commad
//
//  Created by 정명곤 on 2023/07/07.
//

import UIKit

protocol MemberListDisplayLogic: AnyObject {
    func displaySomething(viewModel: MemberListModels.Members.ViewModel)
}

final class MemberListController: UIViewController {
    var interactor: (MemberListBusinessLogic & MemberListDataStore)?
    var router: MemberListRoutingLogic?
    
    var selectedCell: MemberCell?
    var selectedCellImageViewSnapshot: UIView?
    var animator: Animator?

    var members: [Member]?
    
    private let collectionView: UICollectionView = {
        let flowLayout = PinterestLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        return collectionView
    }()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.navigationBar.isHidden = false
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Detail"
        view.backgroundColor = .lightGray
        collectionView.dataSource = self
        collectionView.delegate = self
        setupView()
        registerCell()
        if let layout = collectionView.collectionViewLayout as? PinterestLayout {
            layout.delegate = self
        }
        interactor?.fecthMembers(request: MemberListModels.Members.Request())
    }
    
    func setup() {
        let viewController = self
        let interactor = MemberListInteractor()
        let presenter = MemberListPresenter()
        let router = MemberListRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
         
    }
    
    func registerCell() {
        collectionView.register(MemberCell.self, forCellWithReuseIdentifier: MemberCell.identifier)
    }
    
    func prsentationSecondViewController(imageName: String) {
        
    }

}

extension MemberListController {
    private func setupView() {
        self.view.addSubview(collectionView)
        
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
}

extension MemberListController: MemberListDisplayLogic {
    func displaySomething(viewModel: MemberListModels.Members.ViewModel) {
        DispatchQueue.main.async {
            self.members = viewModel.members
            self.collectionView.reloadData()
        }
    }
}

extension MemberListController: PinterestLayoutDelegate {
    func collectionView(_ collectionView: UICollectionView, heightForPhotoAtIndex indexPath: IndexPath) -> CGFloat {
        return CGFloat(Int.random(in: 150...180))
    }
    
}

extension MemberListController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return members?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MemberCell.identifier, for: indexPath) as? MemberCell else { return UICollectionViewCell() }
        guard let member = members else { return UICollectionViewCell() }
        
        cell.configureCell(name: member[indexPath.row].name)
        cell.layer.cornerRadius = 10
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedCell = collectionView.cellForItem(at: indexPath) as? MemberCell
        selectedCellImageViewSnapshot = selectedCell?.imageView.snapshotView(afterScreenUpdates: false)
        router?.routeToDetail(member: members?[indexPath.row])
    }
    
}

extension MemberListController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        guard let firstViewController = presenting.children.last as? MemberListController,
              let secondViewController = presented as? MemberDetailController,
              let selectedCellImageViewSnapshot = selectedCellImageViewSnapshot 
        else { return nil }
        
        animator = Animator(type: .present, firstViewController: firstViewController, secondViewController: secondViewController, selectedCellImageViewSnapshot: selectedCellImageViewSnapshot)
        
        return animator
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        guard let secondViewController = dismissed as? MemberDetailController,
              let selectedCellImageViewSnapshot = selectedCellImageViewSnapshot else { return nil }
        
        animator = Animator(type: .dismiss, firstViewController: self, secondViewController: secondViewController, selectedCellImageViewSnapshot: selectedCellImageViewSnapshot)
        
        return animator
    }
    
}
