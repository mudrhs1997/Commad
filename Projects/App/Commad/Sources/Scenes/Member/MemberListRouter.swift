//
//  MemberRouter.swift
//  Commad
//
//  Created by 정명곤 on 2023/08/01.
//

import Foundation

protocol MemberListRoutingLogic {
    func routeToDetail()
}

protocol MemberListDataPassing {
    var dataStore: MemberListDataStore? { get }
}

final class MemberListRouter: NSObject, MemberListRoutingLogic, MemberListDataPassing {
    weak var viewController: MemberListController?
    var dataStore: MemberListDataStore?
    
    func routeToDetail() {
        let detailViewController = MemberDetailController()
        guard var detailDataStore = detailViewController.router?.dataStore else { return }
        detailViewController.transitioningDelegate = viewController
        detailViewController.modalPresentationStyle = .fullScreen
        passDataToDetail(source: dataStore!, detination: &detailDataStore)
        viewController?.present(detailViewController, animated: true)
    }
    
    func passDataToDetail(source: MemberListDataStore, detination: inout MemberDetailDataStore) {
        if let indexPath = viewController?.collectionView.indexPathsForSelectedItems?.first?.row {
            detination.member = source.members?[indexPath]
        }
    }
}
