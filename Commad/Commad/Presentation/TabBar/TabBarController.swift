//
//  TabBarController.swift
//  Commad
//
//  Created by 정명곤 on 2023/01/24.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let firstNavigationController = UINavigationController(rootViewController: HomeViewController())
        let firstViewController = firstNavigationController
        
        let secondNavigationController = UINavigationController(rootViewController: RegisterViewController())
        let secondViewController = secondNavigationController
        
        let thirdNavigationController = UINavigationController(rootViewController: CalculatorViewController())
        let thirdViewController = thirdNavigationController
        
        firstViewController.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house.fill"), tag: 0)
        secondViewController.tabBarItem = UITabBarItem(title: "Register", image: UIImage(systemName: "star.fill"), tag: 0)
        thirdViewController.tabBarItem = UITabBarItem(title: "Calculator", image: UIImage(systemName: "creditcard.fill"), tag: 0)
        
        self.tabBar.tintColor = .white
        self.viewControllers = [firstViewController, secondViewController, thirdViewController]
    }
    

    
}
