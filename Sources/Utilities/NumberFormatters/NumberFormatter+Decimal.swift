//
//  NumberFormatter+Decimal.swift
//  
//
//  Created by Manu on 12/06/2023.
//

import Foundation

public extension NumberFormatter {
    /// Number formatter for decimal numbers.
    /// - Parameter locale: The locale to use in the formatter. Default: `.current`.
    /// - Parameter usesGroupingSeparator: Determines whether the receiver displays the group separator.
    /// - Parameter minimumFractionDigits: The minimum number of fraction digits to be displayed by the number formatter. Default is `0`.
    /// - Parameter maximumFractionDigits: The maximum number of fraction digits to be displayed by the number formatter. Default is `2`.
    /// - Returns: The NumberFormatter with the applied properties.
    static func decimal(
        locale: Locale = .current,
        usesGroupingSeparator: Bool = true,
        minimumFractionDigits: Int = 0,
        maximumFractionDigits: Int = 2
    ) -> NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.locale = locale
        formatter.usesGroupingSeparator = usesGroupingSeparator
        formatter.minimumFractionDigits = minimumFractionDigits
        formatter.maximumFractionDigits = maximumFractionDigits
        return formatter
    }
}
