//
//  EntranceViewController.swift
//  Commad
//
//  Created by 정명곤 on 2023/01/31.
//

import UIKit

class EntranceViewController: UIViewController {
    
    private let mainLabel: UILabel = {
        var label = UILabel()
        label.text = "번호를 입력하세요"
        label.frame = CGRect(origin: .zero, size: .zero)
        label.font = .boldSystemFont(ofSize: 28)
        return label
    }()
    
    private let firstTextField: UITextField = {
        var textField = UITextField()
        textField.frame = CGRect(origin: .zero, size: .zero)
        textField.borderStyle = .none
        textField.placeholder = "0"
        return textField
    }()
    
    private let secondTextField: UITextField = {
        var textField = UITextField()
        textField.frame = CGRect(origin: .zero, size: .zero)
        textField.borderStyle = .none
        textField.placeholder = "0"
        return textField
    }()
    
    private let thirdTextField: UITextField = {
        var textField = UITextField()
        textField.frame = CGRect(origin: .zero, size: .zero)
        textField.borderStyle = .none
        textField.placeholder = "0"
        return textField
    }()
    
    private let fourthTextField: UITextField = {
        var textField = UITextField()
        textField.frame = CGRect(origin: .zero, size: .zero)
        textField.borderStyle = .none
        textField.placeholder = "0"
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
        firstTextField.delegate = self
        secondTextField.delegate = self
        thirdTextField.delegate = self
        fourthTextField.delegate = self

    }
    
}

extension EntranceViewController {
    override func viewDidLayoutSubviews() {
        self.view.backgroundColor = .lightGray
        
        self.view.addSubview(mainLabel)
        self.view.addSubview(firstTextField)
        self.view.addSubview(secondTextField)
        self.view.addSubview(thirdTextField)
        self.view.addSubview(fourthTextField)
        self.view.addSubview(mainButton)
        
        mainLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().offset(-30)
            make.height.equalTo(100)
            make.top.equalToSuperview().offset(150)
        }
        
        firstTextField.snp.makeConstraints { make in
            make.top.equalTo(mainLabel).offset(100)
            make.leading.equalToSuperview().offset(30)
            make.height.equalTo(120)
        }
        
        secondTextField.snp.makeConstraints { make in
            make.top.equalTo(mainLabel).offset(100)
            make.leading.equalTo(firstTextField.snp.trailing).offset(30)
            make.height.equalTo(120)
        }
        
        thirdTextField.snp.makeConstraints { make in
            make.top.equalTo(mainLabel).offset(100)
            make.leading.equalTo(secondTextField.snp.trailing).offset(30)
            make.height.equalTo(120)
        }
        
        fourthTextField.snp.makeConstraints { make in
            make.top.equalTo(mainLabel).offset(100)
            make.leading.equalTo(thirdTextField.snp.trailing).offset(30)
            make.trailing.equalToSuperview().offset(-30)
            make.height.equalTo(120)
        }
        
        mainButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().offset(-30)
            make.top.equalTo(firstTextField.snp.bottom).offset(40)
            make.height.equalTo(120)
        }
        
    }
}

extension EntranceViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard textField.text!.count < 1 else { return false }
        return true
    }
}
