//  Public Interfaces.swift
//  Created by Václav Brož on 31/1/2023

import Foundation

public protocol DictionaryCodable: CustomStringConvertible, Codable {
    init?(from string: String)
    var string: String { get }
}

public struct DictionaryDecoder {
    public init() {}
    
    public func decode<T: Decodable>(_ type: T.Type, from input: [String: String]) throws -> T {
        try type.init(from: _DictionaryDecoder(input: input))
    }
}

public struct DictionaryEncoder {
    public init() {}
    
    public func encode<T: Encodable>(_ value: T) throws -> [String: String] {
        let dictionaryEncoder = _DictionaryEncoder()
        try value.encode(to: dictionaryEncoder)
        return dictionaryEncoder.output
    }
}
