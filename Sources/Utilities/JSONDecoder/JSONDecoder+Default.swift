//
//  JSONDecoder.swift
//  
//
//  Created by Manu on 12/06/2023.
//

import Foundation

public extension JSONDecoder {
    /// The JSONDecoder to use across the app.
    /// - Parameters:
    ///   - keyDecodingStrategy: A value that determines how to decode a type’s coding keys from JSON keys. Defaults to `.convertFromSnakeCase`.
    ///   - dateDecodingStrategy: The strategy used when decoding dates from part of a JSON object. Defaults to `.iso8601`.
    /// - Returns: The JSONDecoder with the applied properties.
    static func `default`(
        keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy = .convertFromSnakeCase,
        dateDecodingStrategy: JSONDecoder.DateDecodingStrategy = .iso8601
    ) -> JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = keyDecodingStrategy
        decoder.dateDecodingStrategy = dateDecodingStrategy
        return decoder
    }
}
