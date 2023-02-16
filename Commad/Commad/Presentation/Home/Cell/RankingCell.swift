//
//  RankingCell.swift
//  Commad
//
//  Created by 정명곤 on 2023/02/13.
//

import UIKit

class RankingCell: UICollectionViewCell {
    static let identifier = "rankingCell"
    
    private let borderView: UIView = {
        var view = UIView()
        view.frame = CGRect(origin: .zero, size: .zero)
        view.backgroundColor = .brown
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
}

extension RankingCell {
    func configureViews() {
        self.backgroundColor = .black
        addSubview(borderView)
        
        borderView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(20)
        }
    }
}
