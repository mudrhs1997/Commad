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
    }
}
