//
//  ViewController.swift
//  HSYHarryPotterBookSeries
//
//  Created by hanseoyoung on 3/28/25.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    private let titleLabel = UILabel()
    private let seriesLabel = UILabel()
    private let dataService = DataService()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
        loadBook()
    }

    private func setupViews() {
        // MARK: - Title Label
        titleLabel.font = .boldSystemFont(ofSize: 24)
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 0
        titleLabel.textColor = .black
        view.addSubview(titleLabel)

        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(10)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(20)
        }

        // MARK: - Series Label
        seriesLabel.font = .systemFont(ofSize: 16)
        seriesLabel.textAlignment = .center
        seriesLabel.textColor = .white
        seriesLabel.backgroundColor = .systemBlue
        seriesLabel.clipsToBounds = true
        view.addSubview(seriesLabel)

        seriesLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(40)
        }

        seriesLabel.layer.cornerRadius = 20 
    }

    private func loadBook() {
        dataService.loadBooks { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let books):
                    guard let firstBook = books.first else { return }
                    self?.titleLabel.text = firstBook.title
                    self?.seriesLabel.text = "1"
                case .failure(let error):
                    print("❌ 에러 발생: \(error)")
                }
            }
        }
    }
}
