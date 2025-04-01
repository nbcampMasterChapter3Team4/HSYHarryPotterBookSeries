//
//  BookDedicationStackView.swift
//  HSYHarryPotterBookSeries
//
//  Created by hanseoyoung on 4/1/25.
//

import UIKit

final class BookDedicationStackView: UIStackView {

    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textColor = .label
        label.textAlignment = .left
        label.text = "Dedication"
        return label
    }()

    let dedicationLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.textColor = .darkGray
        label.numberOfLines = .max
        return label
    } ()

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
        addArrangedSubview(dedicationLabel)
    }

    // MARK: - 외부에서 데이터를 업데이트하는 메서드
    /// dedication: 헌사
    func updateContent(dedication: String) {
        dedicationLabel.text = dedication
    }
}
