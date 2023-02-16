//
//  BannerCell.swift
//  Commad
//
//  Created by 정명곤 on 2023/02/14.
//

import UIKit

class BannerCell: UICollectionViewCell {
    static let identifier = "bannerCell"
    
    private let bannerImage: UIImageView = {
        var image = UIImageView()
        image.image = UIImage(named: "image")
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}

extension BannerCell {
    func configureViews() {
        self.addSubview(bannerImage)
        
        bannerImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
