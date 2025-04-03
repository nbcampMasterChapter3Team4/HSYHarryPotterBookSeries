//
//  BookViewDelegate.swift
//  HSYHarryPotterBookSeries
//
//  Created by hanseoyoung on 4/3/25.
//

import UIKit

protocol BookViewDelegate: AnyObject {
    func bookView(_ bookView: BookView, didSelectSeriesButton number: Int)
}
