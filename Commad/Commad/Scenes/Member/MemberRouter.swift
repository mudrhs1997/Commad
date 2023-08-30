//
//  MemberRouter.swift
//  Commad
//
//  Created by 정명곤 on 2023/08/01.
//

import Foundation

protocol MemberRoutingLogic{
    func routeToDetail(member: Member?)
}

protocol MemberDataPassing {
    var dataStore: MemberDataStore? { get }
}

final class MemberRouter: NSObject, MemberRoutingLogic, MemberDataPassing {
    weak var viewController: MemberViewController?
    var dataStore: MemberDataStore?
    
    func routeToDetail(member: Member?) {
        let vc = MemberDetailViewController()
        vc.member = member
        
        viewController?.navigationController?.pushViewController(vc, animated: true)
//        viewController?.present(vc, animated: true)
        
    }
}
