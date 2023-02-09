//
//  UIView+Extensions.swift
//  Commad
//
//  Created by 정명곤 on 2023/01/30.
//

import Foundation
import UIKit

extension UIView {
    func addGradient() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor.clear.cgColor,
            UIColor.black.cgColor
        ]
        gradientLayer.frame = bounds
        layer.addSublayer(gradientLayer)
    }
}
