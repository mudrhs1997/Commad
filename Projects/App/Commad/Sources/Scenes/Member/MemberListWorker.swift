//
//  MemberWorker.swift
//  Commad
//
//  Created by 정명곤 on 2023/08/01.
//

import Foundation
import Combine

protocol MemberListWorkerLogic {
    func fetchMember(_ response: @escaping (MemberListModels.Members.Response) -> Void)
}

class MemberListWorker: MemberListWorkerLogic {
    
    let apiManager = APIService()
    private var cancellables = Set<AnyCancellable>()
    
    func fetchMember(_ response: @escaping (MemberListModels.Members.Response) -> Void) {
        apiManager.fetchMembers().sink { result in
            switch result {
            case .finished:
                print("Fetch Member List Decoding")
            case .failure(_):
                response(MemberListModels.Members.Response(isError: true, message: "Error"))
            }
        } receiveValue: { data in
            response(MemberListModels.Members.Response(members: data, isError: false))
        }
        .store(in: &cancellables)

    }
}
