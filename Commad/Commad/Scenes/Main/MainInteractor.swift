//
//  MainSceneInteractor.swift
//  Commad
//
//  Created by 정명곤 on 2023/07/04.
//

import Foundation

protocol MainDataStore {
    var users: [User]? { get set }
}

protocol MainBusinessLogic {
    func fetchUsers(request: MainModels.Member.Request)
}

class MainInteractor: MainBusinessLogic, MainDataStore {
    
    var presenter: MainPresentationLogic?
    var worker: MainUserWorker?
    
    var users: [User]?
    
    func fetchUsers(request: MainModels.Member.Request) {
        worker = MainUserWorker()
        worker?.fetchUser(offset: request.count) { response in
            self.presenter?.presentationMember(response: MainModels.Member.Response(users: response.users, isError: false, message: "Fields may not be empty."))
        }
    }
    
}
