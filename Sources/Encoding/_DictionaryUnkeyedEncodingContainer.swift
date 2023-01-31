//  _DictionaryUnkeyedEncodingContainer.swift
//  Created by Václav Brož on 31/1/2023

struct _DictionaryUnkeyedEncodingContainer {
    let codingPath: [CodingKey]
}

extension _DictionaryUnkeyedEncodingContainer: UnkeyedEncodingContainer {
    var count: Int {
        -1
    }
    
    mutating func encodeNil() throws {
        throw EncodingError.invalidValue("null", .init(codingPath: codingPath,
                                                       debugDescription: "Encoding object containing array is not supported.",
                                                       underlyingError: _DictionaryEncoder.EncodingError.objectToEncodeContainingArray))
    }
    
    mutating func encode(_ value: Bool) throws {
        throw EncodingError.invalidValue(value, .init(codingPath: codingPath,
                                                      debugDescription: "Encoding object containing array is not supported.",
                                                      underlyingError: _DictionaryEncoder.EncodingError.objectToEncodeContainingArray))
    }
    
    mutating func encode(_ value: String) throws {
        throw EncodingError.invalidValue(value, .init(codingPath: codingPath,
                                                      debugDescription: "Encoding object containing array is not supported.",
                                                      underlyingError: _DictionaryEncoder.EncodingError.objectToEncodeContainingArray))
    }
    
    mutating func encode(_ value: Double) throws {
        throw EncodingError.invalidValue(value, .init(codingPath: codingPath,
                                                      debugDescription: "Encoding object containing array is not supported.",
                                                      underlyingError: _DictionaryEncoder.EncodingError.objectToEncodeContainingArray))
        
    }
    
    mutating func encode(_ value: Float) throws {
        throw EncodingError.invalidValue(value, .init(codingPath: codingPath,
                                                      debugDescription: "Encoding object containing array is not supported.",
                                                      underlyingError: _DictionaryEncoder.EncodingError.objectToEncodeContainingArray))
    }
    
    mutating func encode(_ value: Int) throws {
        throw EncodingError.invalidValue(value, .init(codingPath: codingPath,
                                                      debugDescription: "Encoding object containing array is not supported.",
                                                      underlyingError: _DictionaryEncoder.EncodingError.objectToEncodeContainingArray))
    }
    
    mutating func encode(_ value: Int8) throws {
        throw EncodingError.invalidValue(value, .init(codingPath: codingPath,
                                                      debugDescription: "Encoding object containing array is not supported.",
                                                      underlyingError: _DictionaryEncoder.EncodingError.objectToEncodeContainingArray))
    }
    
    mutating func encode(_ value: Int16) throws {
        throw EncodingError.invalidValue(value, .init(codingPath: codingPath,
                                                      debugDescription: "Encoding object containing array is not supported.",
                                                      underlyingError: _DictionaryEncoder.EncodingError.objectToEncodeContainingArray))
    }
    
    mutating func encode(_ value: Int32) throws {
        throw EncodingError.invalidValue(value, .init(codingPath: codingPath,
                                                      debugDescription: "Encoding object containing array is not supported.",
                                                      underlyingError: _DictionaryEncoder.EncodingError.objectToEncodeContainingArray))
    }
    
    mutating func encode(_ value: Int64) throws {
        throw EncodingError.invalidValue(value, .init(codingPath: codingPath,
                                                      debugDescription: "Encoding object containing array is not supported.",
                                                      underlyingError: _DictionaryEncoder.EncodingError.objectToEncodeContainingArray))
    }
    
    mutating func encode(_ value: UInt) throws {
        throw EncodingError.invalidValue(value, .init(codingPath: codingPath,
                                                      debugDescription: "Encoding object containing array is not supported.",
                                                      underlyingError: _DictionaryEncoder.EncodingError.objectToEncodeContainingArray))
    }
    
    mutating func encode(_ value: UInt8) throws {
        throw EncodingError.invalidValue(value, .init(codingPath: codingPath,
                                                      debugDescription: "Encoding object containing array is not supported.",
                                                      underlyingError: _DictionaryEncoder.EncodingError.objectToEncodeContainingArray))
    }
    
    mutating func encode(_ value: UInt16) throws {
        throw EncodingError.invalidValue(value, .init(codingPath: codingPath,
                                                      debugDescription: "Encoding object containing array is not supported.",
                                                      underlyingError: _DictionaryEncoder.EncodingError.objectToEncodeContainingArray))
    }
    
    mutating func encode(_ value: UInt32) throws {
        throw EncodingError.invalidValue(value, .init(codingPath: codingPath,
                                                      debugDescription: "Encoding object containing array is not supported.",
                                                      underlyingError: _DictionaryEncoder.EncodingError.objectToEncodeContainingArray))
    }
    
    mutating func encode(_ value: UInt64) throws {
        throw EncodingError.invalidValue(value, .init(codingPath: codingPath,
                                                      debugDescription: "Encoding object containing array is not supported.",
                                                      underlyingError: _DictionaryEncoder.EncodingError.objectToEncodeContainingArray))
    }
    
    mutating func encode<T: Encodable>(_ value: T) throws {
        throw EncodingError.invalidValue(value, .init(codingPath: codingPath,
                                                      debugDescription: "Encoding object containing array is not supported.",
                                                      underlyingError: _DictionaryEncoder.EncodingError.objectToEncodeContainingArray))
    }
    
    mutating func nestedContainer<NestedKey: CodingKey>(keyedBy keyType: NestedKey.Type) -> KeyedEncodingContainer<NestedKey> {
        KeyedEncodingContainer(_DictionaryKeyedEncodingContainer(encodedContent: .init(), codingPath: []))
    }
    
    mutating func nestedUnkeyedContainer() -> UnkeyedEncodingContainer {
        _DictionaryUnkeyedEncodingContainer(codingPath: codingPath)
    }
    
    mutating func superEncoder() -> Encoder {
        _DictionaryEncoder()
    }
}
