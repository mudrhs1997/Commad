//
//  PassCodeView.swift
//  Commad
//
//  Created by 정명곤 on 2023/02/14.
//

import UIKit

class PassCodeView: UIView {
    
    private var codeLength: Int = 0
    private var code: Int = 0
    
    private var codeStackView: UIStackView = {
        var stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 30
        return stackView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureViews()
        initCodeStackView()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func initCodeStackView() {
        for _ in 0...4 {
            let codeLabel = UILabel()
            codeLabel.isHidden = true
            codeLabel.alpha = 0.0
            codeLabel.text = "0"
            codeLabel.textColor = .white
            codeLabel.font = .boldSystemFont(ofSize: 45)
            codeLabel.textAlignment = .center
//            codeLabel.widthAnchor.constraint(equalToConstant: codeLabel.intrinsicContentSize.width + 10.0).isActive = true
            
            self.codeStackView.addArrangedSubview(codeLabel)
        }
    }
    
    
    
    
    func insertCode(num: Int) {
        
        guard let codeView = self.codeStackView.arrangedSubviews[self.codeLength] as? UILabel else { return }
        
        codeView.text = "\(num)"
        codeView.transform = CGAffineTransform(translationX: 0, y: -40)
        
        UIView.animate(withDuration: 0.08, delay: 0.0, options: .curveEaseInOut, animations: { [weak self, weak codeView] in
            
            guard let codeView = codeView else { return }
            
            codeView.isHidden = false
            codeView.transform = CGAffineTransform(translationX: 0, y: 0)
            codeView.alpha = 1.0
            
            
        }, completion: nil)
        
        self.codeLength += 1
    }
    
//    func deleteCode() {
//        if codeLength == 0 { return }
//        if codeLength == 1 {
//            self.clearCode()
//        } else {
//            codeLength -= 1
//            code /= 10
//            self.codeLabel.text = "\(code)"
//            self.codeLabel.addKerning(0.7)
//        }
//    }
//
//    func clearCode() {
//        self.codeLabel.text = "번호를 입력해주세요"
//        self.codeLabel.textColor = .lightText
//        self.codeLabel.font = .boldSystemFont(ofSize: 38)
//        self.codeLength = 0
//        self.code = 0
//    }
    
    
}

extension PassCodeView {
    func configureViews() {
        self.addSubview(codeStackView)
        
        codeStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
