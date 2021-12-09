//
//  BooksView.swift
//  CollectionApp
//
//  Created by Konstantin on 29.11.2021.
//

import UIKit

final class BooksView: UIView {
    
    lazy var collectionView: UICollectionView = {
        let view = UICollectionView(frame: self.bounds, collectionViewLayout: createLayout())
        view.backgroundColor = .white
        view.register(CollectionViewCell.self, forCellWithReuseIdentifier: "CollectionViewCell")
        return view
    }()
    
    func createLayout() -> UICollectionViewCompositionalLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(Metrics.fractionalWidthForItemSize),
                                              heightDimension: .fractionalHeight(Metrics.fractionalHeightForItemSize))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: Metrics.contentInsetsBooksVC, leading: Metrics.contentInsetsBooksVC, bottom: Metrics.contentInsetsBooksVC, trailing: Metrics.contentInsetsBooksVC)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(Metrics.fractionalWidthForGroupSize),
                                               heightDimension: .absolute(Metrics.heightDimensionGroupSize))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: Metrics.contentInsetsForTopSecctionBooksVC, leading: Metrics.contentInsetsForSection, bottom: Metrics.contentInsetsForSection, trailing: Metrics.contentInsetsForSection)
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
}
