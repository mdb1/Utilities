//
//  NumberFormatterPercentTests.swift
//  
//
//  Created by Manu on 12/06/2023.
//

import XCTest
@testable import Utilities

final class PercentFormatterCurrencyTests: XCTestCase {
    func test_percentFormatter_en_us_locale() {
        let usLocale: Locale = .init(identifier: "en-US")
        let formatter: NumberFormatter = .percent(locale: usLocale)
        let keyValuePairs: [Double: String] = [
            0: "0%",
            0.051: "5.1%",
            0.101: "10.1%",
            0.15: "15%",
            1: "100%",
            10: "1,000%",
            10.35111: "1,035.11%",
            10.35989: "1,035.99%"
        ]

        keyValuePairs.forEach { element in
            // When
            let formatted = formatter.string(for: NSNumber(value: element.key))
            // Then
            XCTAssertEqual(formatted, element.value)
        }
    }

    func test_percentFormatter_en_us_locale_withoutGroupingSeparator() {
        let usLocale: Locale = .init(identifier: "en-US")
        let formatter: NumberFormatter = .percent(locale: usLocale, usesGroupingSeparator: false)
        let keyValuePairs: [Double: String] = [
            0: "0%",
            0.051: "5.1%",
            0.101: "10.1%",
            0.15: "15%",
            1: "100%",
            10: "1000%",
            10.35111: "1035.11%",
            10.35989: "1035.99%"
        ]

        keyValuePairs.forEach { element in
            // When
            let formatted = formatter.string(for: NSNumber(value: element.key))
            // Then
            XCTAssertEqual(formatted, element.value)
        }
    }

    func test_percentFormatter_es_ar_locale() {
        let esLocale: Locale = .init(identifier: "es-AR")
        let formatter: NumberFormatter = .percent(locale: esLocale)
        let keyValuePairs: [Double: String] = [
            0: "0 %",
            0.051: "5,1 %",
            0.101: "10,1 %",
            0.15: "15 %",
            1: "100 %",
            10: "1.000 %",
            10.35111: "1.035,11 %",
            10.35989: "1.035,99 %"
        ]

        keyValuePairs.forEach { element in
            // When
            let formatted = formatter.string(for: NSNumber(value: element.key))
            // Then
            XCTAssertEqual(formatted, element.value)
        }
    }

    func test_percentFormatter_es_ar_locale_customFractionDigits() {
        let esLocale: Locale = .init(identifier: "es-AR")
        let formatter: NumberFormatter = .percent(locale: esLocale, minimumFractionDigits: 2, maximumFractionDigits: 4)
        let keyValuePairs: [Double: String] = [
            0: "0,00 %",
            0.051: "5,10 %",
            0.101: "10,10 %",
            0.15: "15,00 %",
            1: "100,00 %",
            10: "1.000,00 %",
            10.35111: "1.035,111 %",
            10.35989: "1.035,989 %",
            10.35989239: "1.035,9892 %"
        ]

        keyValuePairs.forEach { element in
            // When
            let formatted = formatter.string(for: NSNumber(value: element.key))
            // Then
            XCTAssertEqual(formatted, element.value)
        }
    }
}
