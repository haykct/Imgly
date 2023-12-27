//
//  DateManager.swift
//  Imgly
//
//  Created by Hayk Hayrapetyan on 25.12.23.
//

import Foundation

/// A manager to convert different date formats.
struct DateManager {
    // MARK: Private properties

    private let formatter = DateFormatter()

    init() {
        formatter.timeZone = TimeZone.current
        formatter.locale = .current
    }

    // MARK: Public methods

    func date(from string: String, format: String) -> Date? {
        formatter.dateFormat = format

        return formatter.date(from: string)
    }

    func string(from date: Date, format: String) -> String {
        formatter.dateFormat = format

        return formatter.string(from: date)
    }

    func convert(date dateString: String, from fromFormat: String, to toFormat: String) -> String? {
        guard let date = date(from: dateString, format: fromFormat) else { return nil }

        return string(from: date, format: toFormat)
    }
}
