//
//  CalculatorView.swift
//  Commad
//
//  Created by 정명곤 on 2023/01/25.
//

import UIKit
import SwiftLayout

class CalculatorView: UIView {

    lazy var moneyAskLabel: UILabel = {
        var label = UILabel()
        label.text = "계산할 금액을 입력해주세요"
        label.frame = CGRect(origin: .zero, size: .zero)
        label.font = .boldSystemFont(ofSize: 28)
        return label
    }()
    
    lazy var valueInputTextField: UITextField = {
       var textField = UITextField()
        textField.frame = CGRect(origin: .zero, size: .zero)
        textField.borderStyle = .none
        textField.placeholder = "숫자만 입력해주세요"
        
        return textField
    }()
    
    lazy var nextButton: UIButton = {
        var button = UIButton()
        button.frame = CGRect(origin:.zero, size: .zero)
        button.setTitle("다음", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 10)
        button.backgroundColor = .commad
        button.layer.cornerRadius = 8
        button.clipsToBounds = true
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.configureViews()
    }

}

extension CalculatorView {
    func configureViews() {
        
        @LayoutBuilder func layout() -> some Layout {
            self.sublayout({
                moneyAskLabel.anchors {
                    Anchors.top.equalTo(self, attribute: .top, constant: 40)
                    Anchors.leading.equalTo(self, attribute: .leading, constant: 10)
                    Anchors.height.equalTo(constant: 60)
                }
                valueInputTextField.anchors {
                    Anchors.top.equalTo(moneyAskLabel, attribute: .bottom, constant: 100)
                    Anchors.leading.equalTo(self, attribute: .leading, constant: 10)
                    Anchors.trailing.equalTo(self, attribute: .trailing, constant: -10)
                    Anchors.height.equalTo(constant: 60)
                }
                nextButton.anchors {
                    Anchors.leading.equalTo(self, attribute: .leading, constant: 10)
                    Anchors.trailing.equalTo(self, attribute: .trailing, constant: -10)
                    Anchors.bottom.equalTo(self, attribute: .bottom, constant: -30)
                    Anchors.height.equalTo(constant: 60)
                }
            })
        }
        
        layout().finalActive()
    }
    
}
