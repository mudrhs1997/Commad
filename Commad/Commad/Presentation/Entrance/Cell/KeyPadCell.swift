//
//  KeyPadCell.swift
//  Commad
//
//  Created by 정명곤 on 2023/02/13.
//

import UIKit
import SnapKit

class KeyPadCell: UICollectionViewCell {
    static let identifier = "keyPadCell"
    
    enum Number: Int {
        case number = 10
        case delete = -1
        case clear = -2
        case blank = -3
    }
    
    class func numberType(for num: Int) -> Number {
        if num >= 0 {
            return .number
        } else if num == Number.delete.rawValue {
            return .delete
        } else if num == Number.clear.rawValue {
            return .clear
        } else {
            return .blank
        }
    }
    
    func getNum(_ indexPath: IndexPath) -> Int{
        if indexPath.item < 9 {
            return indexPath.item + 1
        } else if indexPath.item == 9 {
            return Number.clear.rawValue
        } else if indexPath.item == 10 {
            return 0
        } else if indexPath.item == 11 {
            return Number.delete.rawValue
        } else {
            return Number.blank.rawValue
        }
    }
    
    var num: Int = 0 {
        didSet {
        
            switch KeyPadCell.numberType(for: self.num) {
            case .number:
                self.numLabel.text = "\(self.num)"
                self.numLabel.font = .systemFont(ofSize: 32)
            case .clear:
                self.numLabel.text = "Clear"
                self.numLabel.font = .systemFont(ofSize: 20)
            case .delete:
                self.numLabel.text = "Delete"
                self.numLabel.font = .systemFont(ofSize: 20)
            default:
                self.numLabel.text = ""
            }
        }
    }
    
    private let numLabel: UILabel = {
        var label = UILabel()
        label.frame = CGRect(origin: .zero, size: .zero)
        label.textColor = .lightGray
        label.textAlignment = .center
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
}

extension KeyPadCell {
    func configureViews() {
        self.backgroundColor = .black
        
        addSubview(numLabel)
        
        numLabel.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
        
    }
}
