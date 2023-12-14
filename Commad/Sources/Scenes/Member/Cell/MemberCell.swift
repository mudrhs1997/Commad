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
        imageView.image = UIImage(systemName: "star.fill")
        imageView.contentMode = .scaleAspectFill
        imageView.tintColor = .black
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(name: String) {
        
    }
    
}

extension MemberCell {
    private func setView() {
        self.backgroundColor = .gray
        
        self.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.height.width.equalTo(100)
        }
        
    }
}
