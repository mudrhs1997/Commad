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
        label.text = "HI"
        label.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        return label
    }()
    
    private let mainTextField: UITextField = {
        var textField = UITextField()
        textField.frame = CGRect(x: 100, y: 200, width: 100, height: 100)
        textField.borderStyle = .line
        return textField
    }()
    
    private let mainButton: UIButton = {
        var button = UIButton()
        button.setTitle("click", for: .normal)
        button.frame = CGRect(x: 100, y: 300, width: 100, height: 100)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemPink
        self.view.addSubview(mainLabel)
        self.view.addSubview(mainTextField)
        self.view.addSubview(mainButton)
        mainButton.addTarget(self, action: #selector(changeName(_:)), for: .touchUpInside)
       
        
        
    }
    
    @objc func changeName(_ sender: UIButton) {
        let pushVC = RegisterViewController()
        self.navigationController?.pushViewController(pushVC, animated: true)
    }


}

