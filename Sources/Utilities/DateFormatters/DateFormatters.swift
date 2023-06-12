//
//  DateFormatters.swift
//  
//
//  Created by Manu on 12/06/2023.
//

import Foundation

public extension DateFormatter {
    /// A DateFormatter to display dates with all of your components  day of the week ,day, month and year.
    /// The `dateFormat` property  will always be set to `EEEE, MMMM dd, yyyy`.
    /// Example: `Friday, November 11, 2022`.
    /// - Parameters:
    ///   - timeZone: The timezone for the formatter. Default: `.current`.
    ///   - locale: The locale for the formatter. Default: `.current`.
    /// - Returns: The DateFormatter with the applied properties.
    static func dayMonthNumberYearFormatter(
        timeZone: TimeZone = .current,
        locale: Locale = .current
    ) -> DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, MMMM d, yyyy"
        formatter.timeZone = timeZone
        formatter.locale = locale
        return formatter
    }

    /// A DateFormatter to display times. The `dateStyle` property will always be set to `.none`.
    /// Example: `12:00 PM`.
    /// - Parameters:
    ///   - timeZone: The timezone for the formatter. Default: `.current`.
    ///   - locale: The locale for the formatter. Default: `.current`.
    ///   - timeStyle: The timeStyle for the formatter. Default: `.short`.
    ///   - lowercasedSymbols: amSymbol and pmSymbol will be lowercased. Default: `false`.
    /// - Returns: The DateFormatter with the applied properties.
    static func timeOnlyFormatter(
        timeZone: TimeZone = .current,
        locale: Locale = .current,
        timeStyle: DateFormatter.Style = .short,
        lowercasedSymbols: Bool = false
    ) -> DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        formatter.timeZone = timeZone
        formatter.locale = locale
        formatter.dateStyle = .none
        formatter.timeStyle = timeStyle
        if lowercasedSymbols {
            formatter.amSymbol = formatter.amSymbol.lowercased()
            formatter.pmSymbol = formatter.pmSymbol.lowercased()
        }
        return formatter
    }
}
