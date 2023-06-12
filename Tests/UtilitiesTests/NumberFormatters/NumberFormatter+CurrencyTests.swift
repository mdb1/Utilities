//
//  NumberFormatterCurrencyTests.swift
//  
//
//  Created by Manu on 11/06/2023.
//

import XCTest
@testable import Utilities

final class NumberFormatterCurrencyTests: XCTestCase {
    func test_currencyFormatter_en_us_locale() {
        let usLocale: Locale = .init(identifier: "en-US")
        let formatter: NumberFormatter = .currency(locale: usLocale)
        let keyValuePairs: [Double: String] = [
            0: "$0",
            5.1: "$5.1",
            10.10: "$10.1",
            15: "$15",
            1_000: "$1,000",
            1_000.35: "$1,000.35",
            1_000.351: "$1,000.35",
            1_000.359: "$1,000.36"
        ]

        keyValuePairs.forEach { element in
            // When
            let formatted = formatter.string(for: NSNumber(value: element.key))
            // Then
            XCTAssertEqual(formatted, element.value)
        }
    }

    func test_currencyFormatter_en_us_locale_withoutGroupingSeparator() {
        let usLocale: Locale = .init(identifier: "en-US")
        let formatter: NumberFormatter = .currency(locale: usLocale, usesGroupingSeparator: false)
        let keyValuePairs: [Double: String] = [
            0: "$0",
            15: "$15",
            1_000: "$1000",
            1_000.35: "$1000.35",
            1_000.351: "$1000.35",
            1_000.359: "$1000.36"
        ]

        keyValuePairs.forEach { element in
            // When
            let formatted = formatter.string(for: NSNumber(value: element.key))
            // Then
            XCTAssertEqual(formatted, element.value)
        }
    }

    func test_currencyFormatter_es_ar_locale() {
        let esLocale: Locale = .init(identifier: "es-AR")
        let formatter: NumberFormatter = .currency(locale: esLocale)
        let keyValuePairs: [Double: String] = [
            0: "$ 0",
            5.1: "$ 5,1",
            10.10: "$ 10,1",
            15: "$ 15",
            1_000: "$ 1.000",
            1_000.35: "$ 1.000,35",
            1_000.351: "$ 1.000,35",
            1_000.359: "$ 1.000,36"
        ]

        keyValuePairs.forEach { element in
            // When
            let formatted = formatter.string(for: NSNumber(value: element.key))
            // Then
            XCTAssertEqual(formatted, element.value)
        }
    }

    func test_currencyFormatter_es_ar_locale_customFractionDigits() {
        let esLocale: Locale = .init(identifier: "es-AR")
        let formatter: NumberFormatter = .currency(locale: esLocale, minimumFractionDigits: 2, maximumFractionDigits: 4)
        let keyValuePairs: [Double: String] = [
            0: "$ 0,00",
            5.1: "$ 5,10",
            10.10: "$ 10,10",
            15: "$ 15,00",
            1_000: "$ 1.000,00",
            1_000.35: "$ 1.000,35",
            1_000.351: "$ 1.000,351",
            1_000.359: "$ 1.000,359",
            1_000.3592: "$ 1.000,3592",
            1_000.35921: "$ 1.000,3592"
        ]

        keyValuePairs.forEach { element in
            // When
            let formatted = formatter.string(for: NSNumber(value: element.key))
            // Then
            XCTAssertEqual(formatted, element.value)
        }
    }
}
