//
//  MemberProfileTableViewCell.swift
//  Commad
//
//  Created by 정명곤 on 2023/08/18.
//

import UIKit

final class MemberHistoryCell: UICollectionViewCell {
    static let identifier = "memberHistoryCell"
    
    private let dayLabel = {
        let label = UILabel()
        label.text = "12"
        label.font = .systemFont(ofSize: 20)
        label.textColor = .black
        label.backgroundColor = .lightGray
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(day: Int) {
        dayLabel.text = String(day)
    }
    
}

extension MemberHistoryCell {
    private func setupView() {
        self.addSubview(dayLabel)
        
        dayLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(20)
        }
    }
}
