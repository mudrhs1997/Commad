//
//  ViewController.swift
//  Commad
//
//  Created by 정명곤 on 2023/01/17.
//

import UIKit
import SnapKit


class HomeViewController: UIViewController {
    
    private let mainLabel: UILabel = {
        var label = UILabel()
        label.text = "번호를 입력하세요"
        label.frame = CGRect(origin: .zero, size: .zero)
        label.font = .boldSystemFont(ofSize: 28)
        return label
    }()
    
    private let mainTextField: UITextField = {
        var textField = UITextField()
        textField.frame = CGRect(origin: .zero, size: .zero)
        textField.borderStyle = .line
        textField.layer.borderWidth = 8
        return textField
    }()
    
    private let mainButton: UIButton = {
        var button = UIButton()
        button.setTitle("click", for: .normal)
        button.frame = CGRect(origin: .zero, size: .zero)
        button.tintColor = .black
        button.backgroundColor = .link
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
//        mainButton.addTarget(self, action: #selector(changeName(_:)), for: .touchUpInside)
    }
    
    @objc func changeName(_ sender: UIButton) {
        let pushVC = RegisterViewController()
        self.navigationController?.pushViewController(pushVC, animated: true)
    }
    
        


}

extension HomeViewController {
    override func viewDidLayoutSubviews() {
        
        self.view.addSubview(mainLabel)
        self.view.addSubview(mainTextField)
        self.view.addSubview(mainButton)
        
        mainLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().offset(-30)
            make.height.equalTo(100)
            make.top.equalToSuperview().offset(150)
        }
        
        mainTextField.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().offset(-30)
            make.top.equalTo(mainLabel).offset(100)
            make.height.equalTo(120)
        }
        
        mainButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().offset(-30)
            make.top.equalTo(mainTextField.snp.bottom).offset(40)
            make.height.equalTo(120)
        }
    }
}

