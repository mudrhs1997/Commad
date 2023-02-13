//
//  RegisterViewController.swift
//  Commad
//
//  Created by 정명곤 on 2023/01/18.
//

import UIKit
import SnapKit
import Firebase

class RegisterViewController: UIViewController {
    
    lazy var db = Database.database().reference().child("member")
    
    private let nameLabel: UILabel = {
        var label = UILabel()
        label.text = "이름"
        return label
    }()
    
    private let nameField: UITextField = {
        var textField = UITextField(frame: CGRect(origin: .zero, size: .zero))
        textField.borderStyle = .line
        textField.frame = CGRect(origin: .zero, size: .zero)
        return textField
    }()
    
    private let numberLabel: UILabel = {
        var label = UILabel()
        label.text = "번호"
        return label
    }()
    
    
    private let numberField: UITextField = {
        var textField = UITextField(frame: CGRect(origin: .zero, size: .zero))
        textField.borderStyle = .line
        textField.frame = CGRect(origin: .zero, size: .zero)
        return textField
    }()
    
    private let sendButton: UIButton = {
        var button = UIButton(frame: CGRect(origin: .zero, size: .zero))
        button.setTitle("전송", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 28)
        button.titleLabel?.textColor = .white
        button.backgroundColor = .commad
        button.layer.cornerRadius = 8
        button.clipsToBounds = true
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @objc func registerUser(_ sender: UIButton) {
        db.child(nameField.text ?? "defalut").setValue(["number": numberField.text ?? "", "age": 27])
    }
    
    
    override func viewDidLayoutSubviews() {
        self.view.backgroundColor = .white
        
        self.view.addSubview(nameLabel)
        self.view.addSubview(nameField)
        self.view.addSubview(numberLabel)
        self.view.addSubview(numberField)
        self.view.addSubview(sendButton)
        
        
        self.nameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(150)
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().offset(-30)
        }
        
        self.nameField.snp.makeConstraints { make in
            make.top.equalTo(nameLabel).offset(20)
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().offset(-30)
            make.height.equalTo(50)
        }
        
        self.numberLabel.snp.makeConstraints { make in
            make.top.equalTo(nameField.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().offset(-30)
        }
        
        self.numberField.snp.makeConstraints { make in
            make.top.equalTo(numberLabel).offset(20)
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().offset(-30)
            make.height.equalTo(50)
        }
        
        self.sendButton.snp.makeConstraints { make in
            make.top.equalTo(numberField.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().offset(-30)
            make.height.equalTo(50)
        }
    }
    
    
    
}
