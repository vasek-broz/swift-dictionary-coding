//  _DictionaryEncoder.swift
//  Created by Václav Brož on 31/1/2023

struct _DictionaryEncoder {
    private let encodedContent: EncodedContent
    let codingPath: [CodingKey]

    var output: [String: String] {
        encodedContent.stringKeyValuePairs
    }
    
    init(encodedContent: EncodedContent = .init(), codingPath: [CodingKey] = []) {
        self.encodedContent = encodedContent
        self.codingPath = codingPath
    }

    final class EncodedContent {
        private(set) var stringKeyValuePairs: [String: String] = [:]

        func insert(value: String, at codingPath: [CodingKey]) throws {
            guard codingPath.count == 1 else {
                throw Swift.EncodingError.invalidValue(value, .init(codingPath: codingPath,
                                                                    debugDescription: "Encoding objects containing properties of object type is not supported.",
                                                                    underlyingError: EncodingError.objectToEncodeContainingPropertyOfObjectType))
            }
            stringKeyValuePairs[codingPath[0].stringValue] = value
        }
    }
    
    enum EncodingError: Error {
        case objectToEncodeContainingArray
        case singleValueToEncode
        case objectToEncodeContainingPropertyOfObjectType
    }
}

// MARK: - Codable Conformance -
extension _DictionaryEncoder: Encoder {
    var userInfo: [CodingUserInfoKey : Any] {
        [:]
    }

    func container<Key>(keyedBy type: Key.Type) -> KeyedEncodingContainer<Key> where Key : CodingKey {
        let dictionaryKeyedEncodingContainer = _DictionaryKeyedEncodingContainer<Key>(encodedContent: encodedContent,
                                                                                    codingPath: codingPath)
        return KeyedEncodingContainer(dictionaryKeyedEncodingContainer)
    }

    func unkeyedContainer() -> Swift.UnkeyedEncodingContainer {
        _DictionaryUnkeyedEncodingContainer(codingPath: codingPath)
    }

    func singleValueContainer() -> Swift.SingleValueEncodingContainer {
        _DictionarySingleValueEncodingContainer(encodedContent: encodedContent, codingPath: codingPath)
    }
}
