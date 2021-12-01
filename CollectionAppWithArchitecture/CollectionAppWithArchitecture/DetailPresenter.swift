//
//  DetailPresenter.swift
//  CollectionApp
//
//  Created by Konstantin on 29.11.2021.
//

final class DetailPresenter {

    private weak var detailController: DetailViewController?
    private weak var detailView: DetailView?
    
    var book: ModelBook?
    var indexBook: Int?
    
    func loadView(controller: DetailViewController, view: DetailView) {
        self.detailController = controller
        self.detailView = view
        self.detailView?.configureViews()
        self.setBook()
        self.setContentOnView()
//        self.setHandlers()
    }
    
    private func setBook() {
        guard let index = self.indexBook else { return }
        self.book = ModelBook.getBook(from: index)
    }
    
    private func setContentOnView() {
        guard let image = book?.image,
              let nameBook = book?.name,
              let author = book?.author,
              let genre = book?.genre
        else { return }
        self.detailView?.setImageBook(image: image)
        self.detailView?.setDescriptionBook(name: "Книга - \(nameBook). Автор: \(author). Жанр: \(genre).")
    }
    
//    private func setHandlers() {
//        self.detailView?.onTouchedHandler = { [weak self] in
//            self?.detailController?.presentModalScreen()
//        }
//    }
}

