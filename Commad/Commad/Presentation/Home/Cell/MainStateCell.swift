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
    
    private let middleView: UIView = {
        var view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureViews()
    }
    
    
    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
        
    }
    
    func makeCATransitionLabel(_ label: UILabel) {
        let transition = CATransition()
        transition.duration = 0.3
        transition.timingFunction = .init(name: .easeInEaseOut)
        transition.type = .push
        transition.subtype = .fromBottom
        label.layer.add(transition, forKey: CATransitionType.push.rawValue)
    }


}

extension MainStateCell {
    func configureViews() {
        self.backgroundColor = .black
        
        self.addSubview(userImage)
        self.addSubview(stateImage)
        self.addSubview(todayLabel)
        self.addSubview(middleView)
        
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
        
        
        middleView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.height.equalTo(20)
        }
        
    }
}
