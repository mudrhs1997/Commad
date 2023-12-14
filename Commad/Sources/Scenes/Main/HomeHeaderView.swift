//
//  HomeHeaderView.swift
//  Commad
//
//  Created by 정명곤 on 2023/02/02.
//

import UIKit

class HomeHeaderView: UIView {
    let maxHeight: CGFloat = 250
    let minHeight: CGFloat = 100

    private let headerImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.image = UIImage(named: "image")
        return image
    }()
    private let bottomView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    let entranceButton: UIButton = {
        var button = UIButton()
        button.frame = CGRect(origin: .zero, size: .zero)
        button.backgroundColor = .link
        button.setTitle("출입", for: .normal)
        return button
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
        self.layer.shadowOpacity = 0
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowRadius = 4
        self.layer.shadowOffset = CGSize(width: 0, height: 3)
        self.layer.masksToBounds = false
        
        addSubview(headerImage)
        addSubview(bottomView)
        
        headerImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        bottomView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.height.equalTo(44)
            
        }
        
        self.bottomView.addSubview(entranceButton)
        
        entranceButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(5)
            make.leading.equalToSuperview().offset(30)
            make.bottom.equalTo(headerImage.snp.bottom).inset(5)
            make.width.equalTo(80)
        }
        
    }
}
