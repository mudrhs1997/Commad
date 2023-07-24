//
//  MainScenePresenter.swift
//  Commad
//
//  Created by 정명곤 on 2023/07/04.
//

import Foundation

protocol MainPresentationLogic: AnyObject {
    func presentationMember(response: MainModels.Member.Response)
}

class MainPresenter {
    weak var viewController: MainDisplayLogic?
}

extension MainPresenter: MainPresentationLogic {
    // MARK: Present Something
    func presentationMember(response: MainModels.Member.Response) {
        
        guard let users = response.users else { return }
        let viewModel = MainModels.Member.ViewModel(users: users)
        
        viewController?.displaySomething(viewModel: viewModel)
        
    }
}
