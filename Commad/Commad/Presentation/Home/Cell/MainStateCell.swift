//
//  HomeHeaderView.swift
//  Commad
//
//  Created by 정명곤 on 2023/01/25.
//

import UIKit
import SnapKit

class MainStateCell: UICollectionViewCell {
    static let identirier = "stateCell"

    private let borderView: UIView = {
        var view = UIView()
        view.frame = CGRect(origin: .zero, size: .zero)
        view.backgroundColor = .brown
        view.layer.cornerRadius = 15
        view.clipsToBounds = true
        return view
    }()
    
    
    private let userImage: UIImageView = {
        var image = UIImageView()
        image.image = UIImage(named: "image")
        image.contentMode = .scaleToFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 40
        return image
    }()
    
    private let stateImage: UIImageView = {
        var image = UIImageView()
        image.image = UIImage()
        image.clipsToBounds = true
        image.layer.cornerRadius = 5
        image.backgroundColor = .red
        return image
    }()
    
    private let todayLabel: UILabel = {
        var label = UILabel()
        label.text = "정명곤"
        label.frame = CGRect(origin: .zero, size: .zero)
        label.font = .boldSystemFont(ofSize: 18)
        label.textColor = .white
        return label
    }()
    
    private let monthlyCheckButton: UIButton = {
        var button = UIButton()
        button.frame = CGRect(origin: .zero, size: .zero)
        button.backgroundColor = .darkGray
        button.setTitle("Today's Commad", for: .normal)
        return button
    }()
    
    private let checkLocationButton: UIButton = {
        var button = UIButton()
        button.frame = CGRect(origin: .zero, size: .zero)
        button.backgroundColor = .darkGray
        button.setTitle("Seat", for: .normal)
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

extension MainStateCell {
    func configureViews() {
        self.backgroundColor = .black
        
        self.addSubview(borderView)
        self.addSubview(userImage)
        self.addSubview(stateImage)
        self.addSubview(todayLabel)
        self.addSubview(monthlyCheckButton)
        self.addSubview(checkLocationButton)
        
        borderView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview().inset(10)
            make.height.equalTo(120)
        }
        
        userImage.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().inset(20)
            make.width.equalTo(80)
            make.height.equalTo(80)
        }
        
        stateImage.snp.makeConstraints { make in
            make.centerY.equalTo(userImage.snp.top)
            make.centerX.equalTo(userImage.snp.leading)
            make.width.height.equalTo(10)
        }
        
        todayLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(20)
            make.leading.equalTo(userImage.snp.trailing).offset(20)
        }
        
        monthlyCheckButton.snp.makeConstraints { make in
            make.top.equalTo(userImage.snp.bottom).offset(40)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(20)
        }
        
        checkLocationButton.snp.makeConstraints { make in
            make.top.equalTo(monthlyCheckButton.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(20)
        }
        
        
    }
}
