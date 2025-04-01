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

        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(10)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(20)
        }

        addSubview(seriesLabel)
        seriesLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(20)
        }

        addSubview(bookInfoStackView)
        bookInfoStackView.snp.makeConstraints { make in
            make.top.equalTo(seriesLabel.snp.bottom).offset(16)
            make.leading.trailing.equalTo(self.safeAreaLayoutGuide).inset(5)
        }
    }
}
