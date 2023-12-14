//
//  MemberProfileTableViewCell.swift
//  Commad
//
//  Created by 정명곤 on 2023/08/18.
//

import UIKit

final class MemberProfileCell: UITableViewCell {
    static let identifier = "MemberProfileCell"
    
    var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.frame = CGRect(origin: .zero, size: .zero)
        return label
    }()

    var onoffButon: UIButton = {
        let button = UIButton().layoutInit()
        button.setTitle("On", for: .normal)
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .yellow
        setView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setView()
    }

}

extension MemberProfileCell {
    private func setView() {
        self.addSubview(nameLabel)
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.leading.equalToSuperview().offset(10)
        }
        
        contentView.addSubview(onoffButon)
        
        onoffButon.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            make.width.equalTo(50)
        }
    }
}
