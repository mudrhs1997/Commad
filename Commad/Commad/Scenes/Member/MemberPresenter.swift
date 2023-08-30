//
//  MemberDetailPresenter.swift
//  Commad
//
//  Created by 정명곤 on 2023/07/09.
//

import Foundation

protocol MemberPresentationLogic: AnyObject {
    func presentationMember(response: MemberModels.Members.Response)
}

final class MemberPresenter {
    weak var viewController: MemberDisplayLogic?
}

extension MemberPresenter: MemberPresentationLogic {
    
    func presentationMember(response: MemberModels.Members.Response) {
        
        guard let members = response.members else { return }
        
        let viewModel = MemberModels.Members.ViewModel(members: members)
        
        viewController?.displaySomething(viewModel: viewModel)
    }
}
