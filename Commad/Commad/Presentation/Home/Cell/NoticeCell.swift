//
//  NoticeCell.swift
//  Commad
//
//  Created by 정명곤 on 2023/01/31.
//

import UIKit

class NoticeCell: UICollectionViewCell {
    static let identifier = "noticeCell"
    
    let noticeImage: UIImageView = {
        var image = UIImageView()
        image.image = UIImage(systemName: "megaphone.fill")
        image.frame = CGRect(origin: .zero, size: .zero)
        image.tintColor = .white
        return image
    }()
    
    let noticeLabel: UILabel = {
        var label = UILabel()
        label.text = "아 아 공지사항 있읍니다"
        label.frame = CGRect(origin: .zero, size: .zero)
        label.textColor = .white
        return label
    }()
    
    let noticeButton: UIButton = {
        var button = UIButton()
        button.frame = CGRect(origin: .zero, size: .zero)
        button.backgroundColor = .gray
        button.clipsToBounds = true
        button.layer.cornerRadius = 10
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

extension NoticeCell {
    func configureViews() {
        self.backgroundColor = .black
        
        self.addSubview(noticeImage)
        self.addSubview(noticeLabel)
        self.addSubview(noticeButton)
        
        noticeImage.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().inset(10)
            make.width.equalTo(30)
            make.height.equalTo(30)
        }
       
        
        noticeLabel.snp.makeConstraints { make in
            make.centerY.equalTo(noticeImage.snp.centerY)
            make.leading.equalTo(noticeImage.snp.trailing).offset(10)            
        }
        
        noticeButton.snp.makeConstraints { make in
            make.top.equalTo(noticeLabel.snp.bottom).offset(20)
            make.leading.trailing.bottom.equalToSuperview().inset(20)
        }
        
        
        
        
    }
}
