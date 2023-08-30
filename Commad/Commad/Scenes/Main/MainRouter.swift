//
//  MainSceneRouter.swift
//  Commad
//
//  Created by 정명곤 on 2023/07/04.
//

import Foundation

protocol MainRoutingLogic {
    func routeToDetail()
}

protocol MainDataPassing {
    var dataStore: MainDataStore? { get }
}

class MainRouter: NSObject, MainRoutingLogic, MainDataPassing {
    weak var viewController: MainViewController?
    var dataStore: MainDataStore?
    
    func routeToDetail() {
        let memberViewContorller = MemberViewController()
        
        viewController?.navigationController?.pushViewController(memberViewContorller, animated: true)
    }
    
}
