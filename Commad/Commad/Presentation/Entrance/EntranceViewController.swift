//
//  EntranceViewController.swift
//  Commad
//
//  Created by 정명곤 on 2023/01/31.
//

import UIKit


class EntranceViewController: UIViewController {
    
    
    var passCodeView: PassCodeView = PassCodeView()
    
    
    private let historyView: UIView = {
        var view = UIView()
        view.frame = CGRect(origin: .zero, size: .zero)
        view.backgroundColor = .darkGray
        view.layer.cornerRadius = 20
        view.clipsToBounds = true
        return view
    }()
    
    private let historyLabel: UILabel = {
        var label = UILabel()
        label.text = "2022/02/22"
        label.font = .boldSystemFont(ofSize: 15)
        label.textColor = .white
        return label
    }()
    
    private let keyPadCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .vertical
        
        var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.showsVerticalScrollIndicator = false
        
        collectionView.register(KeyPadCell.self, forCellWithReuseIdentifier: KeyPadCell.identifier)
        
        return collectionView
    }()
    
    private let enterButton: UIButton = {
        var button = UIButton()
        button.backgroundColor = .blue
        button.setTitle("등록", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 20)
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        return button
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        keyPadCollectionView.delegate = self
        keyPadCollectionView.dataSource = self
        
    }
    
}

extension EntranceViewController {
    override func viewDidLayoutSubviews() {
        self.view.backgroundColor = .black
        
        self.view.addSubview(passCodeView)
        self.view.addSubview(historyView)
        self.view.addSubview(historyLabel)
        self.view.addSubview(keyPadCollectionView)
        self.view.addSubview(enterButton)
        

        passCodeView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(50)
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().inset(30)
            make.height.equalTo(120)
        }
        
        historyView.snp.makeConstraints { make in
            make.top.equalTo(passCodeView.snp.bottom).offset(100)
            make.leading.equalToSuperview().offset(40)
            make.trailing.equalToSuperview().inset(40)
            make.height.equalTo(50)
        }
        
        historyLabel.snp.makeConstraints { make in
            make.centerX.equalTo(historyView.snp.centerX)
            make.centerY.equalTo(historyView.snp.centerY)
        }
        
        keyPadCollectionView.snp.makeConstraints { make in
            make.top.equalTo(historyView.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(self.view.safeAreaLayoutGuide).inset(82)
        }
        
        enterButton.snp.makeConstraints { make in
            make.top.equalTo(keyPadCollectionView.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().inset(30)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide).inset(10)
        }
    }
}

extension EntranceViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: KeyPadCell.identifier, for: indexPath) as? KeyPadCell else {
            return UICollectionViewCell()
        }
        cell.num = cell.getNum(indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if indexPath.item == 9 {
//            self.passCodeView.clearCode()
        } else if indexPath.item == 11 {
//            self.passCodeView.deleteCode()
        } else if indexPath.item == 10 {
            self.passCodeView.insertCode(num: 0)
        } else {
            self.passCodeView.insertCode(num: indexPath.item+1)
        }
    
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width / 3, height: collectionView.frame.height * 0.25)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

extension EntranceViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard textField.text!.count < 4 else { return false }
        return true
    }
}
