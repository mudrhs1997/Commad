//
//  ViewController.swift
//  Commad
//
//  Created by 정명곤 on 2023/01/17.
//

import UIKit
import SnapKit


class HomeViewController: UIViewController {
    
    enum Section: CaseIterable {
        case mainState, notices
        
        var title: String {
            switch self {
            case .mainState:
                return "오늘은"
            case .notices:
                return "공지사항은"
            }
        }
    }

    private let mainCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .vertical
        layout.sectionInset = .zero
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.showsVerticalScrollIndicator = false
        
        collectionView.register(MainStateCell.self, forCellWithReuseIdentifier: MainStateCell.identirier)
        collectionView.register(NoticeCell.self, forCellWithReuseIdentifier: NoticeCell.identifier)
        return collectionView
    }()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        mainCollectionView.delegate = self
        mainCollectionView.dataSource = self
        configureViews()
    }

}

extension HomeViewController {
    func configureViews() {
        self.view.backgroundColor = .systemGray2
        self.view.addSubview(mainCollectionView)
        
        mainCollectionView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(self.view.safeAreaInsets.top*2)
            make.leading.trailing.bottom.equalToSuperview()
        }
        
        
    }
    
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = UICollectionViewCell()
        
        if indexPath.section == 0 {
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "stateCell", for: indexPath) as! MainStateCell
            return cell
        } else {
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "noticeCell", for: indexPath) as! NoticeCell
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 {
            return CGSize(width: collectionView.bounds.width, height: collectionView.frame.height * 0.5)
        } else {
            return CGSize(width: collectionView.bounds.width, height: collectionView.frame.height * 0.4)
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 100, right: 0)
    }
    
}


