//
//  NumberFormatter+Currency.swift
//  
//
//  Created by Manu on 11/06/2023.
//

import Foundation

public extension NumberFormatter {
    /// Number formatter for currencies.
    /// - Parameter locale: The locale to use in the formatter. Default: `.current`.
    /// - Parameter minimumFractionDigits: The minimum number of fraction digits to be displayed by the number formatter. Default is `0`.
    /// - Parameter maximumFractionDigits: The maximum number of fraction digits to be displayed by the number formatter. Default is `2`.
    /// - Returns: The NumberFormatter with the applied properties.
    static func currencyFormatter(
        locale: Locale = .current,
        minimumFractionDigits: Int = 0,
        maximumFractionDigits: Int = 2
    ) -> NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.minimumFractionDigits = minimumFractionDigits
        formatter.maximumFractionDigits = maximumFractionDigits
        formatter.numberStyle = .currency
        formatter.locale = locale
        return formatter
    }
}
