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
        bookView.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadBook()
    }
    
    private func loadBook(selectedNum: Int = 0) {
        dataService.loadBooks { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let books):
                    guard books.indices.contains(selectedNum) else { return }
                    let selectedBook = books[selectedNum]
                    
                    self?.bookView.updateContent(title: selectedBook.title)
                    self?.bookView.bookInfoStackView.updateContent(
                        imageName: "harrypotter" + "\(selectedNum + 1)",
                        bookTitle: selectedBook.title,
                        authorName: selectedBook.author,
                        releaseDate: selectedBook.releaseDate,
                        pages: selectedBook.pages)
                    
                    self?.bookView.bookDedicationStackView.updateContent(dedication: selectedBook.dedication)
                    
                    // 요약 텍스트 업데이트
                    let summaryText = selectedBook.summary
                    self?.bookView.bookSummaryStackView.updateContent(summary: summaryText,
                                                                      isExpanded: self?.summaryStateModel.isExpanded ?? false)
                    
                    // 더보기/접기 버튼 액션 처리
                    self?.bookView.bookSummaryStackView.onToggle = { [weak self] in
                        guard let self = self else { return }
                        self.summaryStateModel.isExpanded.toggle()
                        self.bookView.bookSummaryStackView.updateContent(summary: summaryText,
                                                                         isExpanded: self.summaryStateModel.isExpanded)
                    }
                    
                    self?.bookView.bookCapterStackView.updateContent(chapters: selectedBook.chapters.map({ $0.title }))
                    
                case .failure(let error):
                    self?.showAlert(errorMessage: error.localizedDescription)
                }
            }
        }
    }

    func showAlert(errorMessage: String) {
        let alert = UIAlertController(title: "데이터에 오류가 있습니다.",
                                      message: errorMessage,
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "앱 종료", style: .default, handler: { _ in
            UIApplication.shared.perform(#selector(NSXPCConnection.suspend))
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                exit(0)
            }
        }))
        self.present(alert, animated: true, completion: nil)
    }
}

extension ViewController: BookViewDelegate {
    func bookView(_ bookView: BookView, didSelectSeriesButton number: Int) {
        loadBook(selectedNum: number - 1)
    }
}
