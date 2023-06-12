//
//  DateFormattersTests.swift
//  
//
//  Created by Manu on 12/06/2023.
//

import XCTest
@testable import Utilities

final class DateFormattersTests: XCTestCase {
    func test_dayMonthNumberYearFormatter_en_us_locale() throws {
        let usLocale: Locale = .init(identifier: "en-US")
        let timeZone: TimeZone = .gmt
        let formatter: DateFormatter = .dayMonthNumberYearFormatter(timeZone: timeZone, locale: usLocale)
        let keyValuePairs: [Date: String] = [
            try Date("2023-06-12T23:21:01Z", strategy: .iso8601): "Monday, June 12, 2023",
            try Date("2023-06-11T23:21:01Z", strategy: .iso8601): "Sunday, June 11, 2023"
        ]

        keyValuePairs.forEach { element in
            // When
            let formatted = formatter.string(from: element.key)
            // Then
            XCTAssertEqual(formatted, element.value)
        }
    }

    func test_timeOnlyFormatter_en_us_locale_gmt_timeZone() throws {
        let usLocale: Locale = .init(identifier: "en-US")
        let timeZone: TimeZone = .gmt
        let formatter: DateFormatter = .timeOnlyFormatter(timeZone: timeZone, locale: usLocale)
        let keyValuePairs: [Date: String] = [
            try Date("2023-06-12T23:21:01Z", strategy: .iso8601): "11:21 PM",
            try Date("2023-06-11T20:21:01Z", strategy: .iso8601): "8:21 PM"
        ]

        keyValuePairs.forEach { element in
            // When
            let formatted = formatter.string(from: element.key)
            // Then
            XCTAssertEqual(formatted, element.value)
        }
    }

    func test_timeOnlyFormatter_en_us_locale_different_timeZone() throws {
        let usLocale: Locale = .init(identifier: "en-US")
        let timeZone: TimeZone = .init(identifier: "ART")!
        let formatter: DateFormatter = .timeOnlyFormatter(timeZone: timeZone, locale: usLocale)
        let keyValuePairs: [Date: String] = [
            try Date("2023-06-12T23:21:01Z", strategy: .iso8601): "2:21 AM",
            try Date("2023-06-11T10:21:01Z", strategy: .iso8601): "1:21 PM"
        ]

        keyValuePairs.forEach { element in
            // When
            let formatted = formatter.string(from: element.key)
            // Then
            XCTAssertEqual(formatted, element.value)
        }
    }

    func test_dayMonthNumberYearFormatter_es_ar_locale() throws {
        let esLocale: Locale = .init(identifier: "es-AR")
        let timeZone: TimeZone = .gmt
        let formatter: DateFormatter = .dayMonthNumberYearFormatter(timeZone: timeZone, locale: esLocale)
        let keyValuePairs: [Date: String] = [
            try Date("2023-06-12T23:21:01Z", strategy: .iso8601): "lunes, junio 12, 2023",
            try Date("2023-06-11T23:21:01Z", strategy: .iso8601): "domingo, junio 11, 2023"
        ]

        keyValuePairs.forEach { element in
            // When
            let formatted = formatter.string(from: element.key)
            // Then
            XCTAssertEqual(formatted, element.value)
        }
    }

    func test_timeOnlyFormatter_es_ar_locale_gmt_timeZone() throws {
        let esLocale: Locale = .init(identifier: "es-AR")
        let timeZone: TimeZone = .gmt
        let formatter: DateFormatter = .timeOnlyFormatter(timeZone: timeZone, locale: esLocale)
        let keyValuePairs: [Date: String] = [
            try Date("2023-06-12T23:21:01Z", strategy: .iso8601): "23:21",
            try Date("2023-06-11T20:21:01Z", strategy: .iso8601): "20:21"
        ]

        keyValuePairs.forEach { element in
            // When
            let formatted = formatter.string(from: element.key)
            // Then
            XCTAssertEqual(formatted, element.value)
        }
    }

    func test_timeOnlyFormatter_es_ar_locale_different_timeZone() throws {
        let esLocale: Locale = .init(identifier: "es-AR")
        let timeZone: TimeZone = .init(identifier: "ART")!
        let formatter: DateFormatter = .timeOnlyFormatter(timeZone: timeZone, locale: esLocale)
        let keyValuePairs: [Date: String] = [
            try Date("2023-06-12T23:21:01Z", strategy: .iso8601): "02:21",
            try Date("2023-06-11T10:21:01Z", strategy: .iso8601): "13:21"
        ]

        keyValuePairs.forEach { element in
            // When
            let formatted = formatter.string(from: element.key)
            // Then
            XCTAssertEqual(formatted, element.value)
        }
    }
}
