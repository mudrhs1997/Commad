//
//  PassCodeView.swift
//  Commad
//
//  Created by 정명곤 on 2023/02/14.
//

import UIKit

public protocol PassCodeViewDelegate: AnyObject {
    func passCodeChanged(passcode: Int)
}

class PassCodeView: UIView {
    
    public weak var delegate: PassCodeViewDelegate?

    public var placeHolder: String? = "번호를 입력해주세요" {
        didSet {
            self.placeHolderLabel.text = placeHolder
        }
    }
    
    
    private var placeHolderLabel: UILabel = {
        var label = UILabel()
        label.text = "번호"
        label.textColor = .white
        return label
    }()
    
    private let passCodeStackView = UIStackView()
    private var passCodeNumberCount: Int = 0
    
}

extension PassCodeView {
    func configureViews() {
        self.addSubview(placeHolderLabel)
        
        placeHolderLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(50)
        }
    }
}
