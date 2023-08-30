//
//  MainHeaderView.swift
//  Commad
//
//  Created by 정명곤 on 2023/07/24.
//

import UIKit

final class MainHeaderView: UIView {
    let maxHeight: CGFloat = 350
    let minHeight: CGFloat = 180
    
    private let headerImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.frame = CGRect(origin: .zero, size: .zero)
        image.image = UIImage(named: "main")
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    let memberButton: UIButton = {
        let button = UIButton().layoutInit()
        button.setTitle("출입", for: .normal)
        button.setTitleColor(.gray, for: .normal)
        button.layer.cornerRadius = 10
        return button
    }()
    
    let manageButton: UIButton = {
        let button = UIButton().layoutInit()
        button.setTitle("관리", for: .normal)
        button.setTitleColor(.gray, for: .normal)
        button.layer.cornerRadius = 10
        return button
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
        
        headerImage.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview().offset(-100)
            make.height.equalTo(200)
        }
        
        self.addSubview(memberButton)
        
        memberButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.bottom.equalToSuperview()
            make.height.equalTo(50)
        }
        
        self.addSubview(manageButton)
        
        manageButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview().multipliedBy(1.5)
            make.leading.equalTo(memberButton.snp.trailing).offset(10)
            make.trailing.equalToSuperview().offset(-10)
            make.bottom.equalToSuperview()
            make.height.equalTo(50)
        }
    }
}
