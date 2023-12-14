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

    var members: [CGSize] = [CGSize(width: 100, height: 150),
                             CGSize(width: 100, height: 180),
                             CGSize(width: 100, height: 130),
                             CGSize(width: 100, height: 170),
                             CGSize(width: 100, height: 150),
                             CGSize(width: 100, height: 180),
                             CGSize(width: 100, height: 130),
                             CGSize(width: 100, height: 170),
                             CGSize(width: 100, height: 150),
                             CGSize(width: 100, height: 180),
                             CGSize(width: 100, height: 130)]
    
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
        interactor?.fecthMembers(requese: MemberListModels.Members.Request(count: 8))
        setupView()
        registerCell()
        if let layout = collectionView.collectionViewLayout as? PinterestLayout {
            layout.delegate = self
        }
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
    
    func prsentationSecondViewController() {
        let secondViewController = MemberDetailController()
        secondViewController.transitioningDelegate = self
        secondViewController.modalPresentationStyle = .fullScreen
        present(secondViewController, animated: true)
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
//            self.members = viewModel.members
            self.collectionView.reloadData()
        }
    }
}

extension MemberListController: PinterestLayoutDelegate {
    func collectionView(_ collectionView: UICollectionView, heightForPhotoAtIndex indexPath: IndexPath) -> CGFloat {
        return members[indexPath.item].height
    }
    
}

extension MemberListController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return members.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MemberCell.identifier, for: indexPath) as? MemberCell else { return UICollectionViewCell() }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedCell = collectionView.cellForItem(at: indexPath) as? MemberCell
        selectedCellImageViewSnapshot = selectedCell?.imageView.snapshotView(afterScreenUpdates: false)
        prsentationSecondViewController()
    }
    
}

extension MemberListController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        guard let firstViewController = presenting as? MemberListController,
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
