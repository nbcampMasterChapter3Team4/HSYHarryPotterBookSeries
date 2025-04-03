//
//  BookSummaryStackView.swift
//  HSYHarryPotterBookSeries
//
//  Created by hanseoyoung on 4/1/25.
//

import UIKit

final class BookSummaryStackView: UIStackView {

    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textColor = .label
        label.textAlignment = .left
        label.text = "Summary"
        return label
    }()

    let summaryLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.textColor = .darkGray
        label.numberOfLines = 0
        return label
    } ()

    private let toggleButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("더보기", for: .normal)
        return button
    }()

    var onToggle: (() -> Void)?

    private var summaryText: String = ""

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }

    private func setupViews() {
        backgroundColor = .white
        self.spacing = 8
        self.axis = .vertical

        addArrangedSubview(titleLabel)
        addArrangedSubview(summaryLabel)
        addArrangedSubview(toggleButton)

        toggleButton.addTarget(self, action: #selector(toggleAction), for: .touchUpInside)
    }

    // MARK: - 외부에서 데이터를 업데이트하는 메서드
    /// summary: 요약
    /// isExpanded: 더보기 여부
    func updateContent(summary: String, isExpanded: Bool) {
        summaryLabel.text = summary

        self.summaryText = summary
        if summary.count < 450 {
            summaryLabel.text = summary
            toggleButton.isHidden = true
        } else {
            toggleButton.isHidden = false
            if isExpanded {
                summaryLabel.text = summary
                toggleButton.setTitle("접기", for: .normal)
            } else {
                let reducedSummary = String(summary.prefix(450)) + "..."
                summaryLabel.text = reducedSummary
                toggleButton.setTitle("더보기", for: .normal)
            }
        }
    }

    @objc private func toggleAction() {
        onToggle?()
    }
}
