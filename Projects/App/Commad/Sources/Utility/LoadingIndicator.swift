//
//  LoadingIndicator.swift
//  Commad
//
//  Created by 정명곤 on 12/21/23.
//  Copyright © 2023 commad. All rights reserved.
//

import Foundation
import UIKit

final class LoadingIndicator {
    static func showIndicator() {
        let loadingIndicatorView: UIActivityIndicatorView
        guard let window = UIApplication.shared.windows.last else { return }
        
        if let existedView = window.subviews.first(where: { 
            view in view is UIActivityIndicatorView
        }) as? UIActivityIndicatorView {
            loadingIndicatorView = existedView
        } else {
            loadingIndicatorView = UIActivityIndicatorView(style: .large)
            loadingIndicatorView.frame = window.frame
            loadingIndicatorView.color = .brown
            window.addSubview(loadingIndicatorView)
        }
        
        loadingIndicatorView.startAnimating()
    }
    
    static func hideIndicator() {
        guard let window = UIApplication.shared.windows.last else { return }
        window.subviews.filter{ $0 is UIActivityIndicatorView }.forEach{ $0.removeFromSuperview() }
    }
}
