//
//  UILabel+Extensions.swift
//  Commad
//
//  Created by 정명곤 on 2023/02/22.
//

import Foundation
import UIKit

extension UILabel {
    func addKerning(_ value: Double = 0.00) {
        let kernValue = self.font.pointSize * CGFloat(value)
        guard let text = text, !text.isEmpty else { return }
        let string = NSMutableAttributedString(string: text)
        string.addAttribute(NSAttributedString.Key.kern, value: kernValue, range: NSRange(location: 0, length: string.length - 1))
        attributedText = string
    }
}
