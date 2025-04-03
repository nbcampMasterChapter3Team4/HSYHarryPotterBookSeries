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
    private let summaryStateModel = SummaryStateModel()

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
                    guard let self = self, let firstBook = books.first else { return }

                    self.bookView.titleLabel.text = firstBook.title
                    self.bookView.seriesLabel.text = "1"
                    self.bookView.bookInfoStackView.updateContent(
                        imageName: "harrypotter1",
                        bookTitle: firstBook.title,
                        authorName: firstBook.author,
                        releaseDate: firstBook.releaseDate,
                        pages: firstBook.pages)

                    self.bookView.bookDedicationStackView.updateContent(dedication: firstBook.dedication)

                    // 요약 텍스트 업데이트
                    let summaryText = firstBook.summary
                    self.bookView.bookSummaryStackView.updateContent(summary: summaryText,
                                                                  isExpanded: self.summaryStateModel.isExpanded)

                    // 더보기/접기 버튼 액션 처리
                    self.bookView.bookSummaryStackView.onToggle = { [weak self] in
                        guard let self = self else { return }
                        self.summaryStateModel.isExpanded.toggle()
                        self.bookView.bookSummaryStackView.updateContent(summary: summaryText,
                                                                      isExpanded: self.summaryStateModel.isExpanded)
                    }

                    self.bookView.bookCapterStackView.updateContent(chapters: firstBook.chapters.map({ $0.title }))

                case .failure(let error):
                    print("❌ 에러 발생: \(error)")
                }
            }
        }
    }
}
