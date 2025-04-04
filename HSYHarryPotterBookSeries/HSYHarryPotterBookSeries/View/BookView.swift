//
//  BookTitleView.swift
//  HSYHarryPotterBookSeries
//
//  Created by hanseoyoung on 4/1/25.
//

import UIKit
import SnapKit

final class BookView: UIView {

    let bookInfoStackView = BookInfoStackView()
    let bookDedicationStackView = BookDedicationStackView()
    let bookSummaryStackView = BookSummaryStackView()
    let bookCapterStackView = BookChapterStackView()
    
    weak var delegate: BookViewDelegate?

    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()

    private let contentView: UIView = {
        let view = UIView()
        return view
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 24)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textColor = .black
        return label
    }()

    private let seriesStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 15
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        return stackView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setSeriesLabel(selectedBook: 1)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }

    private func setupViews() {
        backgroundColor = .white

        // MARK: - view

        addSubview(titleLabel)
        addSubview(seriesStackView)
        addSubview(scrollView)
        scrollView.addSubview(contentView)

        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(10)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(20)
        }

        seriesStackView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
            //            make.leading.trailing.greaterThanOrEqualToSuperview().inset(20)
            make.width.equalTo(335)

        }

        scrollView.snp.makeConstraints { make in
            make.top.equalTo(seriesStackView.snp.bottom).offset(24)
            make.leading.trailing.equalTo(self.safeAreaLayoutGuide).inset(20)
            make.bottom.equalTo(self.safeAreaLayoutGuide)
        }

        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
        }

        // MARK: - contentView

        contentView.addSubview(bookInfoStackView)
        contentView.addSubview(bookDedicationStackView)
        contentView.addSubview(bookSummaryStackView)
        contentView.addSubview(bookCapterStackView)

        bookInfoStackView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
        }

        bookDedicationStackView.snp.makeConstraints { make in
            make.top.equalTo(bookInfoStackView.snp.bottom).offset(24)
            make.leading.trailing.equalToSuperview()
        }

        bookSummaryStackView.snp.makeConstraints { make in
            make.top.equalTo(bookDedicationStackView.snp.bottom).offset(24)
            make.leading.trailing.equalToSuperview()
        }

        bookCapterStackView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(bookSummaryStackView.snp.bottom).offset(24)
            make.bottom.equalTo(contentView.snp.bottom).inset(16)
        }
    }

    private func setSeriesLabel(selectedBook: Int) {
        seriesStackView.arrangedSubviews.forEach { subview in
            seriesStackView.removeArrangedSubview(subview)
            subview.removeFromSuperview()
        }

        (1...7).forEach { number in
            let button = UIButton(type: .system)
            button.setTitle("\(number)", for: .normal)
            button.titleLabel?.font = .systemFont(ofSize: 16)
            button.titleLabel?.textAlignment = .center
            button.setTitleColor((number == selectedBook) ? .lightGray : .systemBlue, for: .normal)
            button.backgroundColor = (number == selectedBook) ? .systemBlue : .lightGray
            button.layer.cornerRadius = 17.5
            button.tag = number
            button.addTarget(self,
                             action: #selector(handleSeriesButtonTapped(_:)),
                             for: .touchUpInside)
            seriesStackView.addArrangedSubview(button)

            button.snp.makeConstraints { make in
                make.width.height.equalTo(35)
            }
        }
    }

    @objc private func handleSeriesButtonTapped(_ sender: UIButton) {
        delegate?.bookView(self, didSelectSeriesButton: sender.tag)
        setSeriesLabel(selectedBook: sender.tag)
    }

    // MARK: - 외부에서 데이터를 업데이트하는 메서드
    /// title: 책 제목
    func updateContent(title: String) {
        titleLabel.text = title
    }
}
