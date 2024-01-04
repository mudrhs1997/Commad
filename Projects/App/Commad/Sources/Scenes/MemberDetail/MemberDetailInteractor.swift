//
//  MemberDetailInteractor.swift
//  Commad
//
//  Created by 정명곤 on 1/4/24.
//  Copyright (c) 2024 commad. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol MemberDetailBusinessLogic {
    func doSomething(request: MemberDetailModels.History.Request)
}

protocol MemberDetailDataStore {
    var member: Member? { get set }
    var isEntered: Bool? { get set }
}

final class MemberDetailInteractor: MemberDetailBusinessLogic, MemberDetailDataStore {
    
    var presenter: MemberDetailPresentationLogic?
    var worker: MemberDetailWorker?
    
    var member: Member?
    var isEntered: Bool?
    
    // MARK: Do something
    func doSomething(request: MemberDetailModels.History.Request) {
        worker = MemberDetailWorker()
        worker?.fetchMemberHistory(member: request.member) { response in
            print(response.isEntered)
        }
    }
}
