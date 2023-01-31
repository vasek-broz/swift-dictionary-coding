//  _DictionaryDecoder.swift
//  Created by Václav Brož on 31/1/2023

struct _DictionaryDecoder {
    private let input: [String: String]
    let codingPath: [CodingKey]
    
    init(input: [String: String] = [:], codingPath: [CodingKey] = []) {
        self.input = input
        self.codingPath = codingPath
    }
    
    enum DecodingError: Error {
        case objectToDecodeContainingArray
        case singleValueToDecode
        case objectToDecodeContainingPropertyOfObjectType
    }
}

// MARK: - Decoder Conformance -
extension _DictionaryDecoder: Decoder {
    var userInfo: [CodingUserInfoKey : Any] {
        [:]
    }
    
    func container<Key>(keyedBy type: Key.Type) throws -> KeyedDecodingContainer<Key> where Key : CodingKey {
        let dictionaryKeyedDecodingContainer = _DictionaryKeyedDecodingContainer<Key>(input: input,
                                                                                      codingPath: codingPath)
        return KeyedDecodingContainer(dictionaryKeyedDecodingContainer)
    }
    
    func unkeyedContainer() throws -> UnkeyedDecodingContainer {
        _DictionaryUnkeyedDecodingContainer(codingPath: codingPath)
    }
    
    func singleValueContainer() throws -> SingleValueDecodingContainer {
        _DictionarySingleValueDecodingContainer(input: input, codingPath: codingPath)
    }
}
