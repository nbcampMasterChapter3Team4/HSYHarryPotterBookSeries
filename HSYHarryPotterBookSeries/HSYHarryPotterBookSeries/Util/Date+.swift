//
//  Date.swift
//  HSYHarryPotterBookSeries
//
//  Created by hanseoyoung on 4/1/25.
//

import Foundation

extension Date {
    static func dateToString(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM d, yyyy"
        formatter.locale = Locale(identifier: "en_US")
        return formatter.string(from: date)
    }
}
