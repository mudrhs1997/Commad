//
//  MemberDetailInteractor.swift
//  Commad
//
//  Created by 정명곤 on 2023/07/09.
//

import Foundation

protocol MemberDataStore {
    var members: [Member]? { get set }
}

protocol MemberBusinessLogic {
    func fecthMembers(requese: MemberModels.Members.Request)
}

final class MemberInteractor: MemberDataStore, MemberBusinessLogic {
    
    var presenter: MemberPresentationLogic?
    var worker: MemberWorker?
    
    var members: [Member]?
    
    func fecthMembers(requese: MemberModels.Members.Request) {
        worker = MemberWorker()
        worker?.fetchMember({ response in
            self.presenter?.presentationMember(response: MemberModels.Members.Response(members: response.members, isError: false, message: "Fields may not be empty."))
        })
    }
}
