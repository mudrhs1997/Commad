//
//  HomeHeaderView.swift
//  Commad
//
//  Created by 정명곤 on 2023/02/02.
//

import UIKit
import SnapKit

class HomeHeaderView: UIView {
    let maxHeight: CGFloat = 250
    let minHeight: CGFloat = 78

    private let headerImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.image = UIImage(named: "image")
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureViews()
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
}

extension HomeHeaderView {
    func configureViews() {
        addSubview(headerImage)
        
        headerImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        
    }
}
