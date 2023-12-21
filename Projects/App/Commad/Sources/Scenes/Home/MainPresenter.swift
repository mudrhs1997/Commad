//
//  MainScenePresenter.swift
//  Commad
//
//  Created by 정명곤 on 2023/07/04.
//

import Foundation

protocol MainPresentationLogic: AnyObject {
    func presentationMember(response: MainModels.Members.Response)
}

class MainPresenter {
    weak var viewController: MainDisplayLogic?
}

extension MainPresenter: MainPresentationLogic {
    // MARK: Present Something
    func presentationMember(response: MainModels.Members.Response) {
        
        guard let members = response.members else { return }
        let viewModel = MainModels.Members.ViewModel(members: members)
        
        viewController?.displaySomething(viewModel: viewModel)
        
    }
}
