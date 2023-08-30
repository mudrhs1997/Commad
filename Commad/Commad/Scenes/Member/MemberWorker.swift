//
//  MemberWorker.swift
//  Commad
//
//  Created by 정명곤 on 2023/08/01.
//

import Foundation

protocol MemberWorkerLogic {
    func fetchMember(_ response: @escaping (MemberModels.Members.Response) -> Void)
}

class MemberWorker: MemberWorkerLogic {
    
    let apiManager = APIService()
    
    func fetchMember(_ response: @escaping (MemberModels.Members.Response) -> Void) {
        apiManager.fetchAllMember() { result in
            switch result {
            case .success(let members):
                response(MemberModels.Members.Response(members: members, isError: false, message: nil))
            case .failure(let error):
                response(MemberModels.Members.Response(isError: true, message: error.localizedDescription))
            }
        }
    }
}
