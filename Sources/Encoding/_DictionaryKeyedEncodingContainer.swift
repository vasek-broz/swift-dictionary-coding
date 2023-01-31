//  _DictionaryKeyedEncodingContainer.swift
//  Created by Václav Brož on 31/1/2023

struct _DictionaryKeyedEncodingContainer<Key: CodingKey> {
    private let encodedContent: _DictionaryEncoder.EncodedContent
    let codingPath: [CodingKey]
    
    init(encodedContent: _DictionaryEncoder.EncodedContent, codingPath: [CodingKey]) {
        self.encodedContent = encodedContent
        self.codingPath = codingPath
    }
}

// MARK: - KeyedEncodingContainerProtocol -
extension _DictionaryKeyedEncodingContainer: KeyedEncodingContainerProtocol {
    mutating func encodeNil(forKey key: Key) throws {
        try encodedContent.insert(value: "null", at: codingPath + [key])
    }

    mutating func encode(_ value: Bool, forKey key: Key) throws {
        try encodedContent.insert(value: .init(describing: value), at: codingPath + [key])
    }

    mutating func encode(_ value: String, forKey key: Key) throws {
        try encodedContent.insert(value: value, at: codingPath + [key])
    }

    mutating func encode(_ value: Double, forKey key: Key) throws {
        try encodedContent.insert(value: .init(describing: value), at: codingPath + [key])
    }

    mutating func encode(_ value: Float, forKey key: Key) throws {
        try encodedContent.insert(value: .init(describing: value), at: codingPath + [key])
    }

    mutating func encode(_ value: Int, forKey key: Key) throws {
        try encodedContent.insert(value: .init(describing: value), at: codingPath + [key])
    }

    mutating func encode(_ value: Int8, forKey key: Key) throws {
        try encodedContent.insert(value: .init(describing: value), at: codingPath + [key])
    }

    mutating func encode(_ value: Int16, forKey key: Key) throws {
        try encodedContent.insert(value: .init(describing: value), at: codingPath + [key])
    }

    mutating func encode(_ value: Int32, forKey key: Key) throws {
        try encodedContent.insert(value: .init(describing: value), at: codingPath + [key])
    }

    mutating func encode(_ value: Int64, forKey key: Key) throws {
        try encodedContent.insert(value: .init(describing: value), at: codingPath + [key])
    }

    mutating func encode(_ value: UInt, forKey key: Key) throws {
        try encodedContent.insert(value: .init(describing: value), at: codingPath + [key])
    }

    mutating func encode(_ value: UInt8, forKey key: Key) throws {
        try encodedContent.insert(value: .init(describing: value), at: codingPath + [key])
    }

    mutating func encode(_ value: UInt16, forKey key: Key) throws {
        try encodedContent.insert(value: .init(describing: value), at: codingPath + [key])
    }

    mutating func encode(_ value: UInt32, forKey key: Key) throws {
        try encodedContent.insert(value: .init(describing: value), at: codingPath + [key])
    }

    mutating func encode(_ value: UInt64, forKey key: Key) throws {
        try encodedContent.insert(value: .init(describing: value), at: codingPath + [key])
    }

    mutating func encode<T: Encodable>(_ value: T, forKey key: Key) throws {
        if let dictionaryCodableValue = value as? DictionaryCodable {
            try encodedContent.insert(value: dictionaryCodableValue.string, at: codingPath + [key])
        } else {
            throw EncodingError.invalidValue(value, .init(codingPath: codingPath + [key],
                                                          debugDescription: "Encoding objects containing properties of object type is not supported.",
                                                          underlyingError: _DictionaryEncoder.EncodingError.objectToEncodeContainingPropertyOfObjectType))
        }
    }

    mutating func encodeIfPresent(_ value: Bool?, forKey key: Key) throws {
        if let actualValue = value {
            try encode(actualValue, forKey: key)
        } else {
            try encodedContent.insert(value: "null", at: codingPath + [key])
        }
    }

    mutating func encodeIfPresent(_ value: String?, forKey key: Key) throws {
        if let actualValue = value {
            try encode(actualValue, forKey: key)
        } else {
            try encodedContent.insert(value: "null", at: codingPath + [key])
        }
    }

    mutating func encodeIfPresent(_ value: Double?, forKey key: Key) throws {
        if let actualValue = value {
            try encode(actualValue, forKey: key)
        } else {
            try encodedContent.insert(value: "null", at: codingPath + [key])
        }
    }

    mutating func encodeIfPresent(_ value: Float?, forKey key: Key) throws {
        if let actualValue = value {
            try encode(actualValue, forKey: key)
        } else {
            try encodedContent.insert(value: "null", at: codingPath + [key])
        }
    }

    mutating func encodeIfPresent(_ value: Int?, forKey key: Key) throws {
        if let actualValue = value {
            try encode(actualValue, forKey: key)
        } else {
            try encodedContent.insert(value: "null", at: codingPath + [key])
        }
    }

    mutating func encodeIfPresent(_ value: Int8?, forKey key: Key) throws {
        if let actualValue = value {
            try encode(actualValue, forKey: key)
        } else {
            try encodedContent.insert(value: "null", at: codingPath + [key])
        }
    }

    mutating func encodeIfPresent(_ value: Int16?, forKey key: Key) throws {
        if let actualValue = value {
            try encode(actualValue, forKey: key)
        } else {
            try encodedContent.insert(value: "null", at: codingPath + [key])
        }
    }

    mutating func encodeIfPresent(_ value: Int32?, forKey key: Key) throws {
        if let actualValue = value {
            try encode(actualValue, forKey: key)
        } else {
            try encodedContent.insert(value: "null", at: codingPath + [key])
        }
    }

    mutating func encodeIfPresent(_ value: Int64?, forKey key: Key) throws {
        if let actualValue = value {
            try encode(actualValue, forKey: key)
        } else {
            try encodedContent.insert(value: "null", at: codingPath + [key])
        }
    }

    mutating func encodeIfPresent(_ value: UInt?, forKey key: Key) throws {
        if let actualValue = value {
            try encode(actualValue, forKey: key)
        } else {
            try encodedContent.insert(value: "null", at: codingPath + [key])
        }
    }

    mutating func encodeIfPresent(_ value: UInt8?, forKey key: Key) throws {
        if let actualValue = value {
            try encode(actualValue, forKey: key)
        } else {
            try encodedContent.insert(value: "null", at: codingPath + [key])
        }
    }

    mutating func encodeIfPresent(_ value: UInt16?, forKey key: Key) throws {
        if let actualValue = value {
            try encode(actualValue, forKey: key)
        } else {
            try encodedContent.insert(value: "null", at: codingPath + [key])
        }
    }

    mutating func encodeIfPresent(_ value: UInt32?, forKey key: Key) throws {
        if let actualValue = value {
            try encode(actualValue, forKey: key)
        } else {
            try encodedContent.insert(value: "null", at: codingPath + [key])
        }
    }

    mutating func encodeIfPresent(_ value: UInt64?, forKey key: Key) throws {
        if let actualValue = value {
            try encode(actualValue, forKey: key)
        } else {
            try encodedContent.insert(value: "null", at: codingPath + [key])
        }
    }

    mutating func encodeIfPresent<T: Encodable>(_ value: T?, forKey key: Key) throws {
        if let actualValue = value {
            try encode(actualValue, forKey: key)
        } else {
            if let _ = T.self as? DictionaryCodable.Type {
                try encodedContent.insert(value: "null", at: codingPath + [key])
            } else {
                throw EncodingError.invalidValue(value as Any, .init(codingPath: codingPath + [key],
                                                                     debugDescription: "Encoding objects containing properties of object type is not supported.",
                                                                     underlyingError: _DictionaryEncoder.EncodingError.objectToEncodeContainingPropertyOfObjectType))
            }
        }
    }
    
    mutating func nestedContainer<NestedKey: CodingKey>(keyedBy keyType: NestedKey.Type, forKey key: Key) -> KeyedEncodingContainer<NestedKey> {
        let dictionaryKeyedEncodingContainer = _DictionaryKeyedEncodingContainer<NestedKey>(encodedContent: .init(),
                                                                                          codingPath: [])
        return KeyedEncodingContainer(dictionaryKeyedEncodingContainer)
    }

    mutating func nestedUnkeyedContainer(forKey key: Key) -> UnkeyedEncodingContainer {
        _DictionaryUnkeyedEncodingContainer(codingPath: codingPath)
    }

    mutating func superEncoder() -> Encoder {
        superEncoder(forKey: Key(stringValue: "super")!)
    }

    mutating func superEncoder(forKey key: Key) -> Encoder {
        _DictionaryEncoder(encodedContent: encodedContent, codingPath: codingPath + [key])
    }
}
