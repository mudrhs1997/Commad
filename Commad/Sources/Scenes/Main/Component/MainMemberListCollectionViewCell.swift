//
//  MainHeaderCollectionViewCell.swift
//  Commad
//
//  Created by 정명곤 on 2023/07/24.
//

import UIKit

class MainMemberListCollectionViewCell: UICollectionViewCell {
    static let identifier = "MainMemberListCollectionViewCell"
    var members: [Member]?
    
    private let tableView: UITableView = {
        var tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .yellow
        
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        self.setupView()
    }
    
    func fetchUser(users: [Member]?) {
        self.members = users
        tableView.reloadData()
    }
}

extension MainMemberListCollectionViewCell {
    func setupView() {
        self.addSubview(tableView)
//        tableView.register(MemberCell.self, forCellReuseIdentifier: MemberCell.identifier)
        tableView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        tableView.delegate = self
        tableView.dataSource = self
        
    }
}

extension MainMemberListCollectionViewCell: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.members?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: MemberCell.identifier, for: indexPath) as? MemberCell else { return UITableViewCell() }
//        cell.name.text = self.members?[indexPath.row].name
        return UITableViewCell()
    }
    
}
