//
//  MemberDetailViewController.swift
//  Commad
//
//  Created by 정명곤 on 2023/08/15.
//

import UIKit

class MemberDetailController: UIViewController {
    
    var member: Member?
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "star.fill")
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .black
        return imageView
    }()
    
    let xbutton: UIButton = {
        let button = UIButton()
        button.setTitle("X", for: .normal)
        button.tintColor = .black
        return button
    }()
    
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

extension MemberDetailController {
    private func setupView() {
        
        self.view.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(200)
        }
        
        self.view.addSubview(xbutton)
        xbutton.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(50)
        }
        
        self.view.addSubview(memberDetailTableView)
        
        memberDetailTableView.snp.makeConstraints { make in
            make.top.equalTo(xbutton.snp.bottom)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
    }
    
    @objc func toggleButton() {
        dismiss(animated: true)
    }
}

extension MemberDetailController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MemberProfileCell.identifier, for: indexPath) as? MemberProfileCell else { return UITableViewCell() }
        cell.nameLabel.text = self.member?.name
        cell.onoffButon.backgroundColor = .black
        cell.onoffButon.addTarget(self, action: #selector(toggleButton), for: .touchUpInside)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
}
