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
        return view
    }()
    
    var name: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.frame = CGRect(origin: .zero, size: .zero)
        label.textColor = .yellow
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
        
        memberFrame.backgroundColor = .blue
        memberFrame.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        memberFrame.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        memberFrame.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        memberFrame.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
        memberFrame.heightAnchor.constraint(equalToConstant: 120).isActive = true
        memberFrame.layer.cornerRadius = 10
        
        self.addSubview(name)
        
        name.centerYAnchor.constraint(equalTo: memberFrame.centerYAnchor).isActive = true
        name.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
    }
}
