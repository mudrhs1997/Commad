//
//  MainHeaderView.swift
//  Commad
//
//  Created by 정명곤 on 2023/07/24.
//

import UIKit

final class MainHeaderView: UIView {
    let maxHeight: CGFloat = 250
    let minHeight: CGFloat = 78
    
    private let headerImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.frame = CGRect(origin: .zero, size: .zero)
        image.image = UIImage(named: "main")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }

}

extension MainHeaderView {
    func setupView() {
        self.addSubview(headerImage)
        
//        headerImage.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        headerImage.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
//        headerImage.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
//        headerImage.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        headerImage.heightAnchor.constraint(equalToConstant: 250).isActive = true
        headerImage.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
    }
}
