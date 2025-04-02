//
//  BookTitleView.swift
//  HSYHarryPotterBookSeries
//
//  Created by hanseoyoung on 4/1/25.
//

import UIKit
import SnapKit

class BookView: UIView {

    let bookInfoStackView = BookInfoStackView()
    let bookDedicationStackView = BookDedicationStackView()
    let bookSummaryStackView = BookSummaryStackView()
    let bookCapterStackView = BookChapterStackView()

    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()

    let contentView: UIView = {
        let view = UIView()
        return view
    }()

    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 24)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textColor = .black
        return label
    }()

    let seriesLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16)
        label.textAlignment = .center
        label.textColor = .white
        label.backgroundColor = .systemBlue
        label.clipsToBounds = true
        label.layer.cornerRadius = 20
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }

    private func setupViews() {
        backgroundColor = .white

        // MARK: - view

        addSubview(titleLabel)
        addSubview(seriesLabel)
        addSubview(scrollView)
        scrollView.addSubview(contentView)

        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(10)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(20)
        }

        seriesLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
            make.leading.trailing.greaterThanOrEqualToSuperview().inset(20)
        }

        scrollView.snp.makeConstraints { make in
            make.top.equalTo(seriesLabel.snp.bottom).offset(24)
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
}
