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
        self.title = "Рейтинг книг"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.view = booksView.collectionView
        self.booksView.collectionView.delegate = self
        self.booksView.collectionView.dataSource = self
    }
}

extension BooksViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ModelBook.arrayBooks.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        let book = ModelBook.getBook(from: indexPath.item)
        cell.setContentOnView(book: book)
        return cell
    }
}

extension BooksViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailVC = DetailViewController(indexBook: indexPath.item)
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}



