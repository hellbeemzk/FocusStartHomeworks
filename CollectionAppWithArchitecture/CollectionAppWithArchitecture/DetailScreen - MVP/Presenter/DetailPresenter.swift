//
//  DetailPresenter.swift
//  CollectionApp
//
//  Created by Konstantin on 29.11.2021.
//

final class DetailPresenter {

    private weak var detailController: DetailViewController?
    private weak var detailView: DetailView?
    
    private var book: Book?
    
    init(indexBook: Int) {
        self.book = ModelBook.getBook(from: indexBook)
    }
    
    func loadView(controller: DetailViewController, view: DetailView) {
        self.detailController = controller
        self.detailView = view
        self.detailView?.configureViews()
        self.setContentOnView()
        self.setHandlers()
    }
    
    private func setContentOnView() {
        guard let book = book else { return }
        let presentationData = PresentationData(
            image: book.image,
            desctiption: "Книга - \(book.name). Автор: \(book.author). Жанр: \(book.genre)."
        )
        detailView?.setContentOnView(book: presentationData)
    }
    
    private func setHandlers() {
        self.detailView?.onTouchedHandler = { [weak self] in
            self?.detailController?.presentModalScreen()
        }
    }
}

