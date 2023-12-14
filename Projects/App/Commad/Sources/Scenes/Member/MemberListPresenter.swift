//
//  MemberDetailPresenter.swift
//  Commad
//
//  Created by 정명곤 on 2023/07/09.
//

import Foundation

protocol MemberListPresentationLogic: AnyObject {
    func presentationMember(response: MemberListModels.Members.Response)
}

final class MemberListPresenter {
    weak var viewController: MemberListDisplayLogic?
}

extension MemberListPresenter: MemberListPresentationLogic {
    
    func presentationMember(response: MemberListModels.Members.Response) {
        
        guard let members = response.members else { return }
        
        let viewModel = MemberListModels.Members.ViewModel(members: members)
        
        viewController?.displaySomething(viewModel: viewModel)
    }
}
