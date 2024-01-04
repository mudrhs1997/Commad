//
//  MemberDetailInteractor.swift
//  Commad
//
//  Created by 정명곤 on 2023/07/09.
//

import Foundation

protocol MemberListDataStore {
    var members: [Member]? { get set }
}

protocol MemberListBusinessLogic {
    func fecthMembers(request: MemberListModels.Members.Request)
}

final class MemberListInteractor: MemberListDataStore, MemberListBusinessLogic {
    var presenter: MemberListPresentationLogic?
    var worker: MemberListWorker?
    
    var members: [Member]?
    
    func fecthMembers(request: MemberListModels.Members.Request) {
        worker = MemberListWorker()
        worker?.fetchMember({ response in
            self.members = response.members
            self.presenter?.presentationMember(response: MemberListModels.Members.Response(members: response.members, isError: false, message: "Fields may not be empty."))
        })
    }
}
