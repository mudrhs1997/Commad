//
//  MainMemberView.swift
//  Commad
//
//  Created by 정명곤 on 2023/07/06.
//

import UIKit

class MainMemberTableViewCell: UITableViewCell {
    static let identifier = "MainMemberTableViewCell"
    
    let memberFrame: UIView = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.frame = CGRect(origin: .zero, size: .zero)
        view.backgroundColor = .lightGray
        view.layer.cornerRadius = 10
        return view
    }()
    
    var name: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.frame = CGRect(origin: .zero, size: .zero)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setView()
    }

}

extension MainMemberTableViewCell {
    private func setView() {
        
        self.addSubview(memberFrame)
        
        memberFrame.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.bottom.equalToSuperview().offset(-10)
        }
        
        self.addSubview(name)
        
        name.centerYAnchor.constraint(equalTo: memberFrame.centerYAnchor).isActive = true
        name.leadingAnchor.constraint(equalTo: memberFrame.leadingAnchor, constant: 20).isActive = true
    }
}
