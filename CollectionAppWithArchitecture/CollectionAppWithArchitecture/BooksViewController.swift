//
//  BooksViewController.swift
//  CollectionApp
//
//  Created by Konstantin on 29.11.2021.
//

import UIKit

final class BooksViewController: UIViewController {
    
    private let booksView = BooksView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Рейтинг книг"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.view = booksView.collectionView
        booksView.collectionView.delegate = self
        booksView.collectionView.dataSource = self
    }
}

extension BooksViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ModelBook.arrayBooks.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        let book = ModelBook.getBook(from: indexPath.item)
        cell.setNameBook(name: book.name)
        cell.setImageBook(image: book.image)
        return cell
    }
}

extension BooksViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let detailVC = DetailViewController()
//        detailVC.indexBook = indexPath.item
//        detailVC.detailPresenter.indexBook = indexPath.item
//        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}



