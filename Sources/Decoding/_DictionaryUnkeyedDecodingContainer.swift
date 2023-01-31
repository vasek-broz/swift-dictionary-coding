//  _DictionaryUnkeyedDecodingContainer.swift
//  Created by Václav Brož on 30/1/2023

struct _DictionaryUnkeyedDecodingContainer {
    let codingPath: [CodingKey]
}

extension _DictionaryUnkeyedDecodingContainer: UnkeyedDecodingContainer {
    var count: Int? {
        -1
    }
    
    var isAtEnd: Bool {
        false
    }
    
    var currentIndex: Int {
        -1
    }
    
    mutating func decodeNil() throws -> Bool {
        throw DecodingError.dataCorrupted(.init(codingPath: codingPath,
                                                debugDescription: "Deocoding of object containing array is not supported.",
                                                underlyingError: _DictionaryDecoder.DecodingError.objectToDecodeContainingArray))
        
    }
    
    mutating func decode(_ type: Bool.Type) throws -> Bool {
        throw DecodingError.dataCorrupted(.init(codingPath: codingPath,
                                                debugDescription: "Deocoding of object containing array is not supported.",
                                                underlyingError: _DictionaryDecoder.DecodingError.objectToDecodeContainingArray))
    }
    
    mutating func decode(_ type: String.Type) throws -> String {
        throw DecodingError.dataCorrupted(.init(codingPath: codingPath,
                                                debugDescription: "Deocoding of object containing array is not supported.",
                                                underlyingError: _DictionaryDecoder.DecodingError.objectToDecodeContainingArray))
    }
    
    mutating func decode(_ type: Double.Type) throws -> Double {
        throw DecodingError.dataCorrupted(.init(codingPath: codingPath,
                                                debugDescription: "Deocoding of object containing array is not supported.",
                                                underlyingError: _DictionaryDecoder.DecodingError.objectToDecodeContainingArray))
    }
    
    mutating func decode(_ type: Float.Type) throws -> Float {
        throw DecodingError.dataCorrupted(.init(codingPath: codingPath,
                                                debugDescription: "Deocoding of object containing array is not supported.",
                                                underlyingError: _DictionaryDecoder.DecodingError.objectToDecodeContainingArray))
    }
    
    mutating func decode(_ type: Int.Type) throws -> Int {
        throw DecodingError.dataCorrupted(.init(codingPath: codingPath,
                                                debugDescription: "Deocoding of object containing array is not supported.",
                                                underlyingError: _DictionaryDecoder.DecodingError.objectToDecodeContainingArray))
    }
    
    mutating func decode(_ type: Int8.Type) throws -> Int8 {
        throw DecodingError.dataCorrupted(.init(codingPath: codingPath,
                                                debugDescription: "Deocoding of object containing array is not supported.",
                                                underlyingError: _DictionaryDecoder.DecodingError.objectToDecodeContainingArray))
    }
    
    mutating func decode(_ type: Int16.Type) throws -> Int16 {
        throw DecodingError.dataCorrupted(.init(codingPath: codingPath,
                                                debugDescription: "Deocoding of object containing array is not supported.",
                                                underlyingError: _DictionaryDecoder.DecodingError.objectToDecodeContainingArray))
    }
    
    mutating func decode(_ type: Int32.Type) throws -> Int32 {
        throw DecodingError.dataCorrupted(.init(codingPath: codingPath,
                                                debugDescription: "Deocoding of object containing array is not supported.",
                                                underlyingError: _DictionaryDecoder.DecodingError.objectToDecodeContainingArray))
    }
    
    mutating func decode(_ type: Int64.Type) throws -> Int64 {
        throw DecodingError.dataCorrupted(.init(codingPath: codingPath,
                                                debugDescription: "Deocoding of object containing array is not supported.",
                                                underlyingError: _DictionaryDecoder.DecodingError.objectToDecodeContainingArray))
    }
    
    mutating func decode(_ type: UInt.Type) throws -> UInt {
        throw DecodingError.dataCorrupted(.init(codingPath: codingPath,
                                                debugDescription: "Deocoding of object containing array is not supported.",
                                                underlyingError: _DictionaryDecoder.DecodingError.objectToDecodeContainingArray))
    }
    
    mutating func decode(_ type: UInt8.Type) throws -> UInt8 {
        throw DecodingError.dataCorrupted(.init(codingPath: codingPath,
                                                debugDescription: "Deocoding of object containing array is not supported.",
                                                underlyingError: _DictionaryDecoder.DecodingError.objectToDecodeContainingArray))
    }
    
    mutating func decode(_ type: UInt16.Type) throws -> UInt16 {
        throw DecodingError.dataCorrupted(.init(codingPath: codingPath,
                                                debugDescription: "Deocoding of object containing array is not supported.",
                                                underlyingError: _DictionaryDecoder.DecodingError.objectToDecodeContainingArray))
    }
    
    mutating func decode(_ type: UInt32.Type) throws -> UInt32 {
        throw DecodingError.dataCorrupted(.init(codingPath: codingPath,
                                                debugDescription: "Deocoding of object containing array is not supported.",
                                                underlyingError: _DictionaryDecoder.DecodingError.objectToDecodeContainingArray))
    }
    
    mutating func decode(_ type: UInt64.Type) throws -> UInt64 {
        throw DecodingError.dataCorrupted(.init(codingPath: codingPath,
                                                debugDescription: "Deocoding of object containing array is not supported.",
                                                underlyingError: _DictionaryDecoder.DecodingError.objectToDecodeContainingArray))
    }
    
    mutating func decode<T>(_ type: T.Type) throws -> T where T : Decodable {
        throw DecodingError.dataCorrupted(.init(codingPath: codingPath,
                                                debugDescription: "Deocoding of object containing array is not supported.",
                                                underlyingError: _DictionaryDecoder.DecodingError.objectToDecodeContainingArray))
    }
    
    mutating func nestedContainer<NestedKey>(keyedBy type: NestedKey.Type) throws -> KeyedDecodingContainer<NestedKey> where NestedKey : CodingKey {
        throw DecodingError.dataCorrupted(.init(codingPath: codingPath,
                                                debugDescription: "Deocoding of object containing array is not supported.",
                                                underlyingError: _DictionaryDecoder.DecodingError.objectToDecodeContainingArray))
    }
    
    mutating func nestedUnkeyedContainer() throws -> UnkeyedDecodingContainer {
        throw DecodingError.dataCorrupted(.init(codingPath: codingPath,
                                                debugDescription: "Deocoding of object containing array is not supported.",
                                                underlyingError: _DictionaryDecoder.DecodingError.objectToDecodeContainingArray))
    }
    
    mutating func superDecoder() throws -> Decoder {
        throw DecodingError.dataCorrupted(.init(codingPath: codingPath,
                                                debugDescription: "Deocoding of object containing array is not supported.",
                                                underlyingError: _DictionaryDecoder.DecodingError.objectToDecodeContainingArray))
    }
}
