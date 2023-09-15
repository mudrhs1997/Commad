//
//  MemberDetailViewController.swift
//  Commad
//
//  Created by 정명곤 on 2023/07/07.
//

import UIKit

protocol MemberDisplayLogic: AnyObject {
    func displaySomething(viewModel: MemberModels.Members.ViewModel)
}

final class MemberViewController: UIViewController {
    var interactor: (MemberBusinessLogic & MemberDataStore)?
    var router: MemberRoutingLogic?

    var members: [Member]?
    
    private let memberTableView: UITableView = {
        let table = UITableView().layoutInit()
        table.backgroundColor = .white
        return table
    }()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.navigationBar.isHidden = false
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Detail"
        view.backgroundColor = .lightGray
        memberTableView.delegate = self
        memberTableView.dataSource = self
        interactor?.fecthMembers(requese: MemberModels.Members.Request(count: 8))
        setupView()
        registerCell()
    }
    
    func setup() {
        let viewController = self
        let interactor = MemberInteractor()
        let presenter = MemberPresenter()
        let router = MemberRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
         
    }
    
    func registerCell() {
        memberTableView.register(MainMemberTableViewCell.self, forCellReuseIdentifier: MainMemberTableViewCell.identifier)
    }

}

extension MemberViewController {
    private func setupView() {
        
        self.view.addSubview(memberTableView)
        
        memberTableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
}

extension MemberViewController: MemberDisplayLogic {
    func displaySomething(viewModel: MemberModels.Members.ViewModel) {
        DispatchQueue.main.async {
            self.members = viewModel.members
            self.memberTableView.reloadData()
        }
    }
}

extension MemberViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.members?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MainMemberTableViewCell.identifier, for: indexPath) as? MainMemberTableViewCell else { return UITableViewCell() }
        cell.name.text = self.members?[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.router?.routeToDetail(member: self.members?[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}
