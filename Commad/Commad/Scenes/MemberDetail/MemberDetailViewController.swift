//
//  MemberDetailViewController.swift
//  Commad
//
//  Created by 정명곤 on 2023/08/15.
//

import UIKit

class MemberDetailViewController: UIViewController {
    
    var member: Member?
    
    private let memberDetailTableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.frame = CGRect(origin: .zero, size: .zero)
        table.backgroundColor = .link
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        memberDetailTableView.dataSource = self
        memberDetailTableView.delegate = self
        registerCell()
        setupView()
    }
    
    private func registerCell() {
        memberDetailTableView.register(MemberProfileCell.self, forCellReuseIdentifier: MemberProfileCell.identifier)
    }

}

extension MemberDetailViewController {
    private func setupView() {
        
        self.view.addSubview(memberDetailTableView)
        
        memberDetailTableView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
    }
    
    @objc func toggleButton() {
        print("toggle!")
    }
}

extension MemberDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MemberProfileCell.identifier, for: indexPath) as? MemberProfileCell else { return UITableViewCell() }
        cell.nameLabel.text = self.member?.first_name
        cell.onoffButon.backgroundColor = .black
        cell.onoffButon.addTarget(self, action: #selector(toggleButton), for: .touchUpInside)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
}
