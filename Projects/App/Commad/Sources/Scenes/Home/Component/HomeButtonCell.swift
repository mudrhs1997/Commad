//
//  MainHeaderCollectionViewCell.swift
//  Commad
//
//  Created by 정명곤 on 2023/07/24.
//

import UIKit

class HomeButtonCell: UICollectionViewCell {
    static let identifier = "homeButtonCell"
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 42, weight: .bold)
        return label
    }()
    
    private let rightIcon: UIImageView = {
        let imageView = UIImageView()
        let imageConfigure = UIImage.SymbolConfiguration(weight: .bold)
        imageView.image = UIImage(systemName: "chevron.right", withConfiguration: imageConfigure)
        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .darkGray
        
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        self.setupView()
    }
    
    func configureCell(title: String) {
        titleLabel.text = title
    }
}

extension HomeButtonCell {
    func setupView() {
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().offset(10)
        }
        
        addSubview(rightIcon)
        rightIcon.snp.makeConstraints { make in
            make.centerY.equalTo(titleLabel)
            make.trailing.equalToSuperview().inset(10)
        }
    }
}
