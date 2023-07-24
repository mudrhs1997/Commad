//
//  MainSceneUserWorker.swift
//  Commad
//
//  Created by 정명곤 on 2023/07/04.
//

import Foundation

protocol MainUserWorkerLogic {
    func fetchUser(offset: Int, _ response: @escaping (MainModels.Member.Response) -> Void)
}

class MainUserWorker: MainUserWorkerLogic {
    
    let apiManager = APIService()
    
    func fetchUser(offset: Int, _ response: @escaping (MainModels.Member.Response) -> Void) {
        apiManager.fetchUserData(offset: offset) { result in
            switch result {
            case .success(let users):
                response(MainModels.Member.Response(users: users, isError: false, message: nil))
            case .failure(let error):
                response(MainModels.Member.Response(isError: true, message: error.localizedDescription))
            }
        }
    }
}
