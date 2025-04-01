//
//  BookInfoStackView.swift
//  HSYHarryPotterBookSeries
//
//  Created by hanseoyoung on 4/1/25.
//

import UIKit
import SnapKit

class BookInfoStackView: UIStackView {

    // MARK: - 책 표지 이미지

    let coverImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    // MARK: - 책 제목

    let bookTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 2
        return label
    }()

    // MARK: - 저자 정보

    let authorTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textColor = .black
        label.text = "Author"
        return label
    }()

    let authorNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18)
        label.textColor = .darkGray
        return label
    }()

    private let authorStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 8
        stack.alignment = .center
        return stack
    }()

    // MARK: - 출간일 정보

    let releaseTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.textColor = .black
        label.text = "Released"
        return label
    }()

    let releaseDateLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.textColor = .gray
        return label
    }()

    private let releaseStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 8
        stack.alignment = .center
        return stack
    }()

    // MARK: - 페이지 정보

    let pagesTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.textColor = .black
        label.text = "Pages"
        return label
    }()

    let pagesNumberLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.textColor = .gray
        return label
    }()

    private let pagesStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 8
        stack.alignment = .center
        return stack
    }()

    private let containerStackView: UIStackView = {
            let stack = UIStackView()
            stack.axis = .horizontal
            stack.alignment = .top
            stack.spacing = 8
            return stack
        }()

        private let infoStackView: UIStackView = {
            let stack = UIStackView()
            stack.axis = .vertical
            stack.alignment = .leading
            stack.spacing = 8
            return stack
        }()

    // MARK: - 초기화

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

           addSubview(containerStackView)
           containerStackView.snp.makeConstraints { make in
               make.edges.equalToSuperview()
           }

           containerStackView.addArrangedSubview(coverImageView)

           coverImageView.snp.makeConstraints { make in
               make.width.equalTo(80)
               make.height.equalTo(coverImageView.snp.width).multipliedBy(1.5)
           }

           containerStackView.addArrangedSubview(infoStackView)

           infoStackView.addArrangedSubview(bookTitleLabel)

           authorStackView.addArrangedSubview(authorTitleLabel)
           authorStackView.addArrangedSubview(authorNameLabel)
           infoStackView.addArrangedSubview(authorStackView)

           releaseStackView.addArrangedSubview(releaseTitleLabel)
           releaseStackView.addArrangedSubview(releaseDateLabel)
           infoStackView.addArrangedSubview(releaseStackView)

           pagesStackView.addArrangedSubview(pagesTitleLabel)
           pagesStackView.addArrangedSubview(pagesNumberLabel)
           infoStackView.addArrangedSubview(pagesStackView)
       }

    // MARK: - 외부에서 데이터를 업데이트하는 메서드
    /// imageName: 책 표지 이미지 이름
    /// bookTitle: 책 제목
    /// authorName: 저자 이름
    /// releaseDate:  Date 형식으로 입력
    /// pages: 페이지 수
    func updateContent(imageName: String,
                       bookTitle: String,
                       authorName: String,
                       releaseDate: Date,
                       pages: Int) {
        coverImageView.image = UIImage(named: imageName)
        bookTitleLabel.text = bookTitle
        authorNameLabel.text = authorName
        releaseDateLabel.text = Date.dateToString(date: releaseDate)
        pagesNumberLabel.text = "\(pages)"
    }
}
