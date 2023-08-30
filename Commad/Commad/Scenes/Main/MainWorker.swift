//
//  MainSceneUserWorker.swift
//  Commad
//
//  Created by 정명곤 on 2023/07/04.
//

import Foundation

protocol MainWorkerLogic {
    func fetchUser(offset: Int, _ response: @escaping (MainModels.Member.Response) -> Void)
}

class MainWorker: MainWorkerLogic {
    
    let apiManager = APIService()
    
    func fetchUser(offset: Int, _ response: @escaping (MainModels.Member.Response) -> Void) {
        print("fetchUser")
    }
}
