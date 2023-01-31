//  _DictionarySingleValueEncodingContainer.swift
//  Created by Václav Brož on 31/1/2023

struct _DictionarySingleValueEncodingContainer {
    private let encodedContent: _DictionaryEncoder.EncodedContent
    let codingPath: [CodingKey]
    
    init(encodedContent: _DictionaryEncoder.EncodedContent, codingPath: [CodingKey]) {
        self.encodedContent = encodedContent
        self.codingPath = codingPath
    }
}

extension _DictionarySingleValueEncodingContainer: SingleValueEncodingContainer {
    mutating func encodeNil() throws {
        throw EncodingError.invalidValue("null", .init(codingPath: codingPath,
                                                      debugDescription: "Single value encoding is not supported.",
                                                      underlyingError: _DictionaryEncoder.EncodingError.singleValueToEncode))
    }

    mutating func encode(_ value: Bool) throws {
        throw EncodingError.invalidValue(value, .init(codingPath: codingPath,
                                                      debugDescription: "Single value encoding is not supported.",
                                                      underlyingError: _DictionaryEncoder.EncodingError.singleValueToEncode))
    }

    mutating func encode(_ value: String) throws {
        throw EncodingError.invalidValue(value, .init(codingPath: codingPath,
                                                      debugDescription: "Single value encoding is not supported.",
                                                      underlyingError: _DictionaryEncoder.EncodingError.singleValueToEncode))
    }

    mutating func encode(_ value: Double) throws {
        throw EncodingError.invalidValue(value, .init(codingPath: codingPath,
                                                      debugDescription: "Single value encoding is not supported.",
                                                      underlyingError: _DictionaryEncoder.EncodingError.singleValueToEncode))
    }

    mutating func encode(_ value: Float) throws {
        throw EncodingError.invalidValue(value, .init(codingPath: codingPath,
                                                      debugDescription: "Single value encoding is not supported.",
                                                      underlyingError: _DictionaryEncoder.EncodingError.singleValueToEncode))
    }

    mutating func encode(_ value: Int) throws {
        throw EncodingError.invalidValue(value, .init(codingPath: codingPath,
                                                      debugDescription: "Single value encoding is not supported.",
                                                      underlyingError: _DictionaryEncoder.EncodingError.singleValueToEncode))
    }

    mutating func encode(_ value: Int8) throws {
        throw EncodingError.invalidValue(value, .init(codingPath: codingPath,
                                                      debugDescription: "Single value encoding is not supported.",
                                                      underlyingError: _DictionaryEncoder.EncodingError.objectToEncodeContainingArray))
    }

    mutating func encode(_ value: Int16) throws {
        throw EncodingError.invalidValue(value, .init(codingPath: codingPath,
                                                      debugDescription: "Single value encoding is not supported.",
                                                      underlyingError: _DictionaryEncoder.EncodingError.singleValueToEncode))
    }

    mutating func encode(_ value: Int32) throws {
        throw EncodingError.invalidValue(value, .init(codingPath: codingPath,
                                                      debugDescription: "Single value encoding is not supported.",
                                                      underlyingError: _DictionaryEncoder.EncodingError.singleValueToEncode))
    }

    mutating func encode(_ value: Int64) throws {
        throw EncodingError.invalidValue(value, .init(codingPath: codingPath,
                                                      debugDescription: "Single value encoding is not supported.",
                                                      underlyingError: _DictionaryEncoder.EncodingError.singleValueToEncode))
    }

    mutating func encode(_ value: UInt) throws {
        throw EncodingError.invalidValue(value, .init(codingPath: codingPath,
                                                      debugDescription: "Single value encoding is not supported.",
                                                      underlyingError: _DictionaryEncoder.EncodingError.singleValueToEncode))
    }

    mutating func encode(_ value: UInt8) throws {
        throw EncodingError.invalidValue(value, .init(codingPath: codingPath,
                                                      debugDescription: "Single value encoding is not supported.",
                                                      underlyingError: _DictionaryEncoder.EncodingError.singleValueToEncode))
    }

    mutating func encode(_ value: UInt16) throws {
        throw EncodingError.invalidValue(value, .init(codingPath: codingPath,
                                                      debugDescription: "Single value encoding is not supported.",
                                                      underlyingError: _DictionaryEncoder.EncodingError.singleValueToEncode))
    }

    mutating func encode(_ value: UInt32) throws {
        throw EncodingError.invalidValue(value, .init(codingPath: codingPath,
                                                      debugDescription: "Single value encoding is not supported.",
                                                      underlyingError: _DictionaryEncoder.EncodingError.singleValueToEncode))
    }

    mutating func encode(_ value: UInt64) throws {
        throw EncodingError.invalidValue(value, .init(codingPath: codingPath,
                                                      debugDescription: "Single value encoding is not supported.",
                                                      underlyingError: _DictionaryEncoder.EncodingError.singleValueToEncode))
    }

    mutating func encode<T: Encodable>(_ value: T) throws {
        if let stringDictionaryCodableValue = value as? DictionaryCodable {
            try encodedContent.insert(value: stringDictionaryCodableValue.string, at: codingPath)
        } else {
            throw EncodingError.invalidValue(value as Any, .init(codingPath: codingPath,
                                                                 debugDescription: "Encoding objects containing properties of object type is not supported.",
                                                                 underlyingError: _DictionaryEncoder.EncodingError.objectToEncodeContainingPropertyOfObjectType))
        }
    }
}
