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
        
        let secondNavigationController = UINavigationController(rootViewController: EntranceViewController())
        let secondViewController = secondNavigationController
        
        firstViewController.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house.fill"), tag: 0)
        secondViewController.tabBarItem = UITabBarItem(title: "출입", image: UIImage(systemName: "star.fill"), tag: 0)
        
        self.tabBar.tintColor = .white
        self.tabBar.backgroundColor = .black
        self.viewControllers = [firstViewController, secondViewController]
    }
    

    
}
