//
//  MemberRouter.swift
//  Commad
//
//  Created by 정명곤 on 2023/08/01.
//

import Foundation

protocol MemberListRoutingLogic {
    func routeToDetail(member: Member?)
}

protocol MemberListDataPassing {
    var dataStore: MemberListDataStore? { get }
}

final class MemberListRouter: NSObject, MemberListRoutingLogic, MemberListDataPassing {
    weak var viewController: MemberListController?
    var dataStore: MemberListDataStore?
    
    func routeToDetail(member: Member?) {
        let vc = MemberDetailController()
        vc.member = member
        
        viewController?.navigationController?.pushViewController(vc, animated: true)
//        viewController?.present(vc, animated: true)
        
    }
}
