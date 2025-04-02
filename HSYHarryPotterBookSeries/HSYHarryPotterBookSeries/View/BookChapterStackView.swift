//
//  BookChapterStackView.swift
//  HSYHarryPotterBookSeries
//
//  Created by hanseoyoung on 4/2/25.
//

import UIKit

final class BookChapterStackView: UIStackView {
    let tittleLabel: UILabel = {
        let label = UILabel()
        label.text = "Chapters"
        label.font = .systemFont(ofSize: 18, weight: .bold)
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }

    func setupViews() {
        axis = .vertical
        distribution = .fillEqually
        spacing = 8

        addArrangedSubview(tittleLabel)
    }

    // MARK: - 외부에서 데이터를 업데이트하는 메서드
    /// chapters: 챕터 배열
    func updateContent(chapters: [String]) {
        for chapter in chapters {
            let chapterLabel = UILabel()
            chapterLabel.font = .systemFont(ofSize: 14)
            chapterLabel.textColor = .darkGray
            chapterLabel.text = chapter
            addArrangedSubview(chapterLabel)
        }
    }
}
