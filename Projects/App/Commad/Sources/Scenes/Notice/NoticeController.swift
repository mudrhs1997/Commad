//
//  NoticeViewController.swift
//  Commad
//
//  Created by 정명곤 on 12/29/23.
//  Copyright (c) 2023 commad. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol NoticeDisplayLogic: AnyObject {
    func displaySomething(viewModel: Notice.Something.ViewModel)
}

final class NoticeController: UIViewController, NoticeDisplayLogic {
    var interactor: NoticeBusinessLogic?
    var router: (NSObjectProtocol & NoticeRoutingLogic & NoticeDataPassing)?
    
    // MARK: Object lifecycle
    init() {
        super.init(nibName: nil, bundle: nil)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: Setup
    private func setup() {
        let viewController = self
        let interactor = NoticeInteractor()
        let presenter = NoticePresenter()
        let router = NoticeRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        doSomething()
    }
    
    // MARK: Do something
    func doSomething() {
        let request = Notice.Something.Request()
        interactor?.doSomething(request: request)
    }
    
    func displaySomething(viewModel: Notice.Something.ViewModel) {
        
    }
}
