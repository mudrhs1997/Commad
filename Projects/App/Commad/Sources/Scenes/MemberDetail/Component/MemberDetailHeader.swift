//
//  MemberDetailHeader.swift
//  Commad
//
//  Created by 정명곤 on 12/21/23.
//  Copyright © 2023 commad. All rights reserved.
//

import UIKit

final class MemberDetailHeader: UIView {
    let maxHeight: CGFloat = 350
    let minHeight: CGFloat = 180
    var isEntered: Bool = false
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.tintColor = .black
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "main")
        return imageView
    }()
    
    let nameLabel: UILabel = {
        var label = UILabel()
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

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension MemberDetailHeader {
    private func setupView() {
        addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.top).offset(15)
            make.leading.equalToSuperview().offset(15)
        }
        
        addSubview(exitButton)
        exitButton.snp.makeConstraints { make in
            make.bottom.equalTo(imageView.snp.bottom).inset(20)
            make.leading.trailing.equalToSuperview().inset(15)
            make.height.equalTo(50)
        }
    }
}
