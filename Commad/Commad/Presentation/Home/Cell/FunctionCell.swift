//
//  functionCell.swift
//  Commad
//
//  Created by 정명곤 on 2023/02/06.
//

import UIKit

class FunctionCell: UICollectionViewCell {
    static let identifier = "functionCell"
    
    private let manageUserButton: UIButton = {
        var button = UIButton()
        button.frame = CGRect(origin: .zero, size: .zero)
        button.backgroundColor = .white
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        return button
    }()
    
    private let calculatorButton: UIButton = {
        var button = UIButton()
        button.frame = CGRect(origin: .zero, size: .zero)
        button.backgroundColor = .white
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        return button
    }()
    
    private let manageEntranceButton: UIButton = {
        var button = UIButton()
        button.frame = CGRect(origin: .zero, size: .zero)
        button.backgroundColor = .white
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureViews()
    }
    
    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
        
    }
}

extension FunctionCell {
    func configureViews() {
        self.backgroundColor = .red
        
        self.addSubview(manageUserButton)
        self.addSubview(calculatorButton)
        self.addSubview(manageEntranceButton)
        
        manageUserButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.centerX.equalToSuperview()
            make.height.equalToSuperview().inset(20)
            make.width.equalToSuperview().multipliedBy(0.25)
        }
        
        calculatorButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.centerX.equalTo(manageUserButton.snp.centerX).multipliedBy(1.66)
            make.height.equalToSuperview().inset(20)
            make.width.equalToSuperview().multipliedBy(0.25)
        }
        
        manageEntranceButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.centerX.equalTo(manageUserButton.snp.centerX).multipliedBy(0.33)
            make.height.equalToSuperview().inset(20)
            make.width.equalToSuperview().multipliedBy(0.25)
        }
        
    }
}
