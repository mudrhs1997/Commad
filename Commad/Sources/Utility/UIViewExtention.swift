//
//  UIViewExtention.swift
//  Commad
//
//  Created by 정명곤 on 2023/06/24.
//

import Foundation
import UIKit

extension UIView {
    
    private func layoutInit() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.frame = CGRect(origin: .zero, size: .zero)
    }
    
}

extension UIButton {
    
    func layoutInit() -> UIButton {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.frame = CGRect(origin: .zero, size: .zero)
        return self
    }
}

extension UITableView {
    
    func layoutInit() -> UITableView {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.frame = CGRect(origin: .zero, size: .zero)
        return self
    }
}
