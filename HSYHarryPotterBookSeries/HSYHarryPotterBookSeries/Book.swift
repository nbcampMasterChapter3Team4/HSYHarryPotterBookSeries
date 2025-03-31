//
//  Book.swift
//  HSYHarryPotterBookSeries
//
//  Created by hanseoyoung on 3/30/25.
//
import Foundation

struct BookResponse: Codable {
    let data: [Book]
}

struct Book: Codable {
    let attributes: Attributes
}

struct Attributes: Codable {
    let title: String
    let author: String
    let pages: Int
    let releaseDate: Date
    let dedication: String
    let summary: String
    let wiki: String
    let chapters: [Chapter]

    enum CodingKeys: String, CodingKey {
        case title, author, pages
        case releaseDate = "release_date"
        case dedication, summary, wiki, chapters
    }
}

struct Chapter: Codable {
    let title: String
}

extension String {
  // MARK: - String -> Date
  public func toDate(_ dateFormat: String = "yyyy-MM-dd'T'HH:mm:ss") -> Date? {
    let dateFormatter = DateFormatter()
    dateFormatter.locale = Locale(identifier: "ko_KR")
    dateFormatter.timeZone = TimeZone(identifier: "UTC")
    dateFormatter.dateFormat = dateFormat

    if let date = dateFormatter.date(from: self) {
      return date
    }
    return nil
  }
}
