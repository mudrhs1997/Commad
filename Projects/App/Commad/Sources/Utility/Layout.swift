//
//  Layout.swift
//  Commad
//
//  Created by 정명곤 on 12/21/23.
//  Copyright © 2023 commad. All rights reserved.
//

import Foundation
import UIKit

struct Layouts {
    // MARK: - Main CollectionView Layout
    enum History: CaseIterable {
        case month
        case day
        
        func section() -> NSCollectionLayoutSection {
            switch self {
            case .month:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(60))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 1)
                group.contentInsets = .init(top: 0, leading: 10, bottom: 0, trailing: 10)
                
                let section = NSCollectionLayoutSection(group: group)
                section.boundarySupplementaryItems = [
                    .init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(50)),
                          elementKind: UICollectionView.elementKindSectionHeader,
                          alignment: .topLeading)
                ]
                section.contentInsets = .init(top: 10, leading: 8, bottom: 0, trailing: 8)
                
                return section
                
            case .day:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.15))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 1)
                group.contentInsets = .init(top: 20, leading: 10, bottom: 0, trailing: 10)
                
                let section = NSCollectionLayoutSection(group: group)
                section.boundarySupplementaryItems = [
                    .init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(50)),
                          elementKind: UICollectionView.elementKindSectionHeader,
                          alignment: .topLeading)
                ]
                section.orthogonalScrollingBehavior = .none
                section.contentInsets = .init(top: 10, leading: 10, bottom: 0, trailing: 10)
                
                return section
            }
        }
        
    }
}
