//
//  MemberDetailViewController.swift
//  Commad
//
//  Created by 정명곤 on 2023/08/15.
//

import UIKit

class MemberDetailController: UIViewController {
    
    var imageName: String?
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.tintColor = .black
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let nameLabel: UILabel = {
        var label = UILabel()
        label.text = "정명곤"
        label.tintColor = .black
        label.font = .systemFont(ofSize: 36)
        return label
    }()
    
    let exitButton: UIButton = {
        let button = UIButton()
        button.setTitle("입장하기", for: .normal)
        button.backgroundColor = .link
        button.layer.cornerRadius = 18
        return button
    }()
    
    private let collectionView: UICollectionView = {
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
        
        collectionView.register(HomeButtonCell.self, forCellWithReuseIdentifier: HomeButtonCell.identifier)
        
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        collectionView.dataSource = self
        collectionView.delegate = self
        registerCell()
        setupView()
        imageView.image = UIImage(named: imageName!)
    }
    
    private func registerCell() {
//        collectionView.register(MemberProfileCell.self, forCellWithReuseIdentifier: MemberProfileCell.identifier)
    }

}

extension MemberDetailController {
    private func setupView() {
        
        self.view.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(200)
        }
        
        self.view.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.top)
            make.leading.equalToSuperview().offset(15)
        }
        
        self.view.addSubview(exitButton)
        exitButton.addTarget(self, action: #selector(toggleButton), for: .touchUpInside)
        exitButton.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(50)
        }
        
        self.view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(exitButton.snp.bottom)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
    }
    
    @objc func toggleButton() {
        dismiss(animated: true)
    }
}

extension MemberDetailController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView == self.collectionView {
            let originY: CGFloat = scrollView.contentOffset.y
            let modifiedTopHeight = 1 / originY
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeButtonCell.identifier, for: indexPath) as? HomeButtonCell else { return UICollectionViewCell() }
//        cell.fetchUser(users: self.members)
        
        return cell
    }
    
}
