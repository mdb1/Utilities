//
//  JSONEncoder+Default.swift
//  
//
//  Created by Manu on 12/06/2023.
//

import Foundation

public extension JSONEncoder {
    /// The JSONEncoder to use across the app.
    /// - Parameters:
    ///   - keyEncodingStrategy: A value that determines how to encode a type’s coding keys as JSON keys. Defaults to `.convertToSnakeCase`.
    ///   - dateEncodingStrategy: The strategy used when encoding dates as part of a JSON object. Defaults to `.iso8601`.
    /// - Returns: The JSONEncoder with the applied properties.
    static func `default`(
        keyEncodingStrategy: JSONEncoder.KeyEncodingStrategy = .convertToSnakeCase,
        dateEncodingStrategy: JSONEncoder.DateEncodingStrategy = .iso8601
    ) -> JSONEncoder {
        let encoder = JSONEncoder()
        encoder.keyEncodingStrategy = keyEncodingStrategy
        encoder.dateEncodingStrategy = dateEncodingStrategy
        return encoder
    }
}
