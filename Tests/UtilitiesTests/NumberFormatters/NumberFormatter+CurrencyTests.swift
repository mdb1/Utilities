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
        let formatter: NumberFormatter = .currencyFormatter(locale: usLocale)
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
            let currency = formatter.string(for: NSNumber(value: element.key))
            // Then
            XCTAssertEqual(currency, element.value)
        }
    }

    func test_currencyFormatter_es_ar_locale() {
        let usLocale: Locale = .init(identifier: "es-AR")
        let formatter: NumberFormatter = .currencyFormatter(locale: usLocale)
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
            let currency = formatter.string(for: NSNumber(value: element.key))
            // Then
            XCTAssertEqual(currency, element.value)
        }
    }
}
