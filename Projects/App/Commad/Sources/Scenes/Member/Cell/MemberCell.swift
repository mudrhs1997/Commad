//
//  MainMemberView.swift
//  Commad
//
//  Created by 정명곤 on 2023/07/06.
//

import UIKit

class MemberCell: UICollectionViewCell {
    static let identifier = "memberCell"
    
    var imageView: UIImageView = {
        var imageView = UIImageView()
        imageView.image = UIImage(named: "main")
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .white
        return imageView
    }()
    
    let nameLabel: UILabel = {
        var label = UILabel()
        label.text = "정명곤"
        label.textColor = .white
        label.font = .systemFont(ofSize: 18, weight: .bold)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(name: String) {
        nameLabel.text = name
    }
    
}

extension MemberCell {
    private func setView() {
        self.backgroundColor = .gray
        
        self.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        self.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
    }
}
