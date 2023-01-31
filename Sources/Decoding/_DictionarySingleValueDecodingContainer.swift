//  _DictionarySingleValueDecodingContainer.swift
//  Created by Václav Brož on 31/1/2023

struct _DictionarySingleValueDecodingContainer {
    private let input: [String: String]
    let codingPath: [CodingKey]
    
    init(input: [String: String], codingPath: [CodingKey]) {
        self.input = input
        self.codingPath = codingPath
    }
}

extension _DictionarySingleValueDecodingContainer: SingleValueDecodingContainer {
    func decodeNil() -> Bool {
        false
    }
    
    func decode(_ type: Bool.Type) throws -> Bool {
        throw DecodingError.dataCorrupted(.init(codingPath: codingPath,
                                                debugDescription: "Single value decoding is not supported.",
                                                underlyingError: _DictionaryDecoder.DecodingError.singleValueToDecode))
    }
    
    func decode(_ type: String.Type) throws -> String {
        throw DecodingError.dataCorrupted(.init(codingPath: codingPath,
                                                debugDescription: "Single value decoding is not supported.",
                                                underlyingError: _DictionaryDecoder.DecodingError.singleValueToDecode))
    }
    
    func decode(_ type: Double.Type) throws -> Double {
        throw DecodingError.dataCorrupted(.init(codingPath: codingPath,
                                                debugDescription: "Single value decoding is not supported.",
                                                underlyingError: _DictionaryDecoder.DecodingError.singleValueToDecode))
    }
    
    func decode(_ type: Float.Type) throws -> Float {
        throw DecodingError.dataCorrupted(.init(codingPath: codingPath,
                                                debugDescription: "Single value decoding is not supported.",
                                                underlyingError: _DictionaryDecoder.DecodingError.singleValueToDecode))
    }
    
    func decode(_ type: Int.Type) throws -> Int {
        throw DecodingError.dataCorrupted(.init(codingPath: codingPath,
                                                debugDescription: "Single value decoding is not supported.",
                                                underlyingError: _DictionaryDecoder.DecodingError.singleValueToDecode))
    }
    
    func decode(_ type: Int8.Type) throws -> Int8 {
        throw DecodingError.dataCorrupted(.init(codingPath: codingPath,
                                                debugDescription: "Single value decoding is not supported.",
                                                underlyingError: _DictionaryDecoder.DecodingError.singleValueToDecode))
    }
    
    func decode(_ type: Int16.Type) throws -> Int16 {
        throw DecodingError.dataCorrupted(.init(codingPath: codingPath,
                                                debugDescription: "Single value decoding is not supported.",
                                                underlyingError: _DictionaryDecoder.DecodingError.singleValueToDecode))
    }
    
    func decode(_ type: Int32.Type) throws -> Int32 {
        throw DecodingError.dataCorrupted(.init(codingPath: codingPath,
                                                debugDescription: "Single value decoding is not supported.",
                                                underlyingError: _DictionaryDecoder.DecodingError.singleValueToDecode))
    }
    
    func decode(_ type: Int64.Type) throws -> Int64 {
        throw DecodingError.dataCorrupted(.init(codingPath: codingPath,
                                                debugDescription: "Single value decoding is not supported.",
                                                underlyingError: _DictionaryDecoder.DecodingError.singleValueToDecode))
    }
    
    func decode(_ type: UInt.Type) throws -> UInt {
        throw DecodingError.dataCorrupted(.init(codingPath: codingPath,
                                                debugDescription: "Single value decoding is not supported.",
                                                underlyingError: _DictionaryDecoder.DecodingError.singleValueToDecode))
    }
    
    func decode(_ type: UInt8.Type) throws -> UInt8 {
        throw DecodingError.dataCorrupted(.init(codingPath: codingPath,
                                                debugDescription: "Single value decoding is not supported.",
                                                underlyingError: _DictionaryDecoder.DecodingError.singleValueToDecode))
    }
    
    func decode(_ type: UInt16.Type) throws -> UInt16 {
        throw DecodingError.dataCorrupted(.init(codingPath: codingPath,
                                                debugDescription: "Single value decoding is not supported.",
                                                underlyingError: _DictionaryDecoder.DecodingError.singleValueToDecode))
    }
    
    func decode(_ type: UInt32.Type) throws -> UInt32 {
        throw DecodingError.dataCorrupted(.init(codingPath: codingPath,
                                                debugDescription: "Single value decoding is not supported.",
                                                underlyingError: _DictionaryDecoder.DecodingError.singleValueToDecode))
    }
    
    func decode(_ type: UInt64.Type) throws -> UInt64 {
        throw DecodingError.dataCorrupted(.init(codingPath: codingPath,
                                                debugDescription: "Single value decoding is not supported.",
                                                underlyingError: _DictionaryDecoder.DecodingError.singleValueToDecode))
    }
    
    func decode<T>(_ type: T.Type) throws -> T where T : Decodable {
        guard let codingKey = codingPath.first else {
            throw DecodingError.dataCorrupted(.init(codingPath: codingPath,
                                                    debugDescription: "Passed coding path for single value decoding was empty."))
        }
        guard let dictionaryCodableType = type.self as? DictionaryCodable.Type else {
            throw DecodingError.dataCorrupted(.init(codingPath: codingPath,
                                                    debugDescription: "Decoding objects containing properties of object type is not supported.",
                                                    underlyingError: _DictionaryDecoder.DecodingError.objectToDecodeContainingPropertyOfObjectType))
        }
        guard let value = input[codingKey.stringValue] else {
            throw DecodingError.keyNotFound(codingKey, .init(codingPath: codingPath,
                                                             debugDescription: "Coding key \(codingKey.stringValue) was not found."))
        }
        return dictionaryCodableType.init(from: value) as! T
    }
}
