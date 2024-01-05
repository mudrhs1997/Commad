//
//  CollectionViewHeader.swift
//  Commad
//
//  Created by 정명곤 on 12/21/23.
//  Copyright © 2023 commad. All rights reserved.
//

import Foundation
import UIKit

final class CollectionViewHeader: UICollectionReusableView {
    static let identifier = "collectionViewHeader"
    
    private let leftButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .black
        button.setTitle("<", for: .normal)
        return button
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18)
        label.textColor = .black
        label.text = "12월"
        return label
    }()
    
    
    private let rightButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .black
        button.setTitle(">", for: .normal)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setupView()
    }
    
    func configure(title: String) {
        titleLabel.text = title
    }
    
}

extension CollectionViewHeader {
    private func setupView() {
        
        addSubview(leftButton)
        leftButton.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview().offset(10)
            make.bottom.equalToSuperview().inset(5)
        }
        
        addSubview(rightButton)
        rightButton.snp.makeConstraints { make in
            make.centerY.equalTo(leftButton.snp.centerY)
            make.trailing.equalToSuperview().inset(10)
        }
        
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.centerY.equalTo(leftButton.snp.centerY)
            make.centerX.equalToSuperview()
        }
        
    }
}
