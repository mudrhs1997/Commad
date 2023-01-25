//
//  CalculatorViewController.swift
//  Commad
//
//  Created by 정명곤 on 2023/01/18.
//

import UIKit
import SwiftLayout


class CalculatorViewController: UIViewController {
    
    private let calculatorView: CalculatorView = CalculatorView()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.title = "관리"
        
       
        // Do any additional setup after loading the view.
    }
    
    
}

extension CalculatorViewController {
    override func viewDidLayoutSubviews() {
        @LayoutBuilder func layout() -> some Layout {
            view.sublayout({
                calculatorView.anchors {
                    Anchors.top.leading.trailing.bottom.equalTo(view.safeAreaLayoutGuide)
                }
            })
        }
        
        layout().finalActive()
    }
    
}
