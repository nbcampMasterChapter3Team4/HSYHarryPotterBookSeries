//
//  ViewController.swift
//  HSYHarryPotterBookSeries
//
//  Created by hanseoyoung on 3/28/25.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    private let bookView = BookView()
    private let dataService = DataService()  // Model 역할

    override func loadView() {
        view = bookView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        loadBook()
    }

    private func loadBook() {
        dataService.loadBooks { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let books):
                    guard let firstBook = books.first else { return }
                    self?.bookView.titleLabel.text = firstBook.title
                    self?.bookView.seriesLabel.text = "1"
                    self?.bookView.bookInfoStackView.updateContent(imageName: "harrypotter1",
                                                                   bookTitle: firstBook.title,
                                                                   authorName: firstBook.author,
                                                                   releaseDate: firstBook.releaseDate,
                                                                   pages: firstBook.pages)
                    self?.bookView.bookDedicationStackView.updateContent(dedication: firstBook.dedication)
                    self?.bookView.bookSummaryStackView.updateContent(dedication: firstBook.summary)
                case .failure(let error):
                    print("❌ 에러 발생: \(error)")
                }
            }
        }
    }
}
