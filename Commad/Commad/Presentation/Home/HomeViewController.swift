//
//  ViewController.swift
//  Commad
//
//  Created by 정명곤 on 2023/01/17.
//

import UIKit
import SnapKit


class HomeViewController: UIViewController {
    
    let dbHelper = DBHelper.shared
    var userData: [User] = []
    
    private let mainHeaderView: HomeHeaderView = HomeHeaderView()
    private let backgoundImage: UIImageView = {
        var image = UIImageView(image: UIImage(named: "background"))
        return image
    }()
    
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
        collectionView.register(FunctionCell.self, forCellWithReuseIdentifier: FunctionCell.identifier)
        collectionView.register(RankingCell.self, forCellWithReuseIdentifier: RankingCell.identifier)
        collectionView.register(BannerCell.self, forCellWithReuseIdentifier: BannerCell.identifier)
        return collectionView
    }()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        mainCollectionView.delegate = self
        mainCollectionView.dataSource = self
        configureViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    @objc
    private func showEntranceViewController(_ sender: UIButton) {
        let entranceViewController = EntranceViewController()
        self.navigationController?.pushViewController(entranceViewController, animated: true)
    }


}

extension HomeViewController {
    func configureViews() {
        self.view.addSubview(backgoundImage)
        self.view.addSubview(mainCollectionView)
        self.view.addSubview(mainHeaderView)
        
        
        backgoundImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        mainHeaderView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(200)
        }
        
        self.mainHeaderView.entranceButton.addTarget(self, action: #selector(self.showEntranceViewController), for: .touchUpInside)
        
        mainCollectionView.snp.makeConstraints { make in
            make.top.equalTo(self.mainHeaderView.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview().offset(30)
        }
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = UICollectionViewCell()
        
        if indexPath.section == 0 {
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "stateCell", for: indexPath) as! MainStateCell
            return cell
        } else if indexPath.section == 1 {
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "noticeCell", for: indexPath) as! NoticeCell
            return cell
        } else if indexPath.section == 2{
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "functionCell", for: indexPath) as! FunctionCell
            return cell
        } else if indexPath.section == 3{
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "rankingCell", for: indexPath) as! RankingCell
            return cell
        } else {
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "bannerCell", for: indexPath) as! BannerCell
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 {
            return CGSize(width: collectionView.bounds.width, height: collectionView.frame.height * 0.4)
        } else if indexPath.section == 1 {
            return CGSize(width: collectionView.bounds.width, height: collectionView.frame.height * 0.25)
        } else {
            return CGSize(width: collectionView.bounds.width, height: collectionView.frame.height * 0.2)
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView == self.mainCollectionView {
            let originY: CGFloat = scrollView.contentOffset.y
            let modifiedTopHeight = mainHeaderView.maxHeight - originY
            let height = min(max(modifiedTopHeight, mainHeaderView.minHeight), mainHeaderView.maxHeight)
            
            mainHeaderView.snp.updateConstraints { make in
                make.height.equalTo(height)
            }
        }
    }
    
}


