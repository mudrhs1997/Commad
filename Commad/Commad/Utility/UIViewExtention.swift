//
//  UIViewExtention.swift
//  Commad
//
//  Created by 정명곤 on 2023/06/24.
//

import Foundation
import UIKit

extension UIView {
    
    func layoutInit() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.frame = CGRect(origin: .zero, size: .zero)
    }
    
}
