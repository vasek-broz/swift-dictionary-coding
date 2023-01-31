//   _DictionaryKeyedDecodingContainer.swift
//  Created by Václav Brož on 30/1/2023

struct _DictionaryKeyedDecodingContainer<Key: CodingKey> {
    private let input: [String: String]
    let codingPath: [CodingKey]
    
    init(input: [String: String], codingPath: [CodingKey]) {
        self.input = input
        self.codingPath = codingPath
    }
}

extension _DictionaryKeyedDecodingContainer: KeyedDecodingContainerProtocol {
    var allKeys: [Key] {
        codingPath.map { codingKey in
            codingKey as! Key
        }
    }
    
    func contains(_ key: Key) -> Bool {
        input.keys.contains(key.stringValue)
    }
    
    func decodeNil(forKey key: Key) throws -> Bool {
        guard let value = input[key.stringValue] else {
            throw DecodingError.keyNotFound(key, .init(codingPath: codingPath,
                                                       debugDescription: "Coding key \(key.stringValue) was not found."))
        }
        return value != "null"
    }
    
    func decode(_ type: Bool.Type, forKey key: Key) throws -> Bool {
        guard let stringValue = input[key.stringValue] else {
            throw DecodingError.keyNotFound(key, .init(codingPath: codingPath,
                                                       debugDescription: "Coding key \(key.stringValue) was not found."))
        }
        switch stringValue {
        case "true":
            return true
        case "false":
            return false
        default:
            throw DecodingError.typeMismatch(type.self, .init(codingPath: codingPath,
                                                              debugDescription: "Type of value at \(key.stringValue) does not match to the expected type \(type)."))
        }
    }
    
    func decode(_ type: String.Type, forKey key: Key) throws -> String {
        guard let value = input[key.stringValue] else {
            throw DecodingError.keyNotFound(key, .init(codingPath: codingPath,
                                                       debugDescription: "Coding key \(key.stringValue) was not found."))
        }
        return value
    }
    
    func decode(_ type: Double.Type, forKey key: Key) throws -> Double {
        guard let stringValue = input[key.stringValue] else {
            throw DecodingError.keyNotFound(key, .init(codingPath: codingPath,
                                                       debugDescription: "Coding key \(key.stringValue) was not found."))
        }
        guard let value = Double(stringValue) else {
            throw DecodingError.typeMismatch(type.self, .init(codingPath: codingPath,
                                                              debugDescription: "Type of value at \(key.stringValue) does not match to the expected type \(type)."))
        }
        return value
    }
    
    func decode(_ type: Float.Type, forKey key: Key) throws -> Float {
        guard let stringValue = input[key.stringValue] else {
            throw DecodingError.keyNotFound(key, .init(codingPath: codingPath,
                                                       debugDescription: "Coding key \(key.stringValue) was not found."))
        }
        guard let value = Float(stringValue) else {
            throw DecodingError.typeMismatch(type.self, .init(codingPath: codingPath,
                                                              debugDescription: "Type of value at \(key.stringValue) does not match to the expected type \(type)."))
        }
        return value
    }
    
    func decode(_ type: Int.Type, forKey key: Key) throws -> Int {
        guard let stringValue = input[key.stringValue] else {
            throw DecodingError.keyNotFound(key, .init(codingPath: codingPath,
                                                       debugDescription: "Coding key \(key.stringValue) was not found."))
        }
        guard let value = Int(stringValue) else {
            throw DecodingError.typeMismatch(type.self, .init(codingPath: codingPath,
                                                              debugDescription: "Type of value at \(key.stringValue) does not match to the expected type \(type)."))
        }
        return value
    }
    
    func decode(_ type: Int8.Type, forKey key: Key) throws -> Int8 {
        guard let stringValue = input[key.stringValue] else {
            throw DecodingError.keyNotFound(key, .init(codingPath: codingPath,
                                                       debugDescription: "Coding key \(key.stringValue) was not found."))
        }
        guard let value = Int8(stringValue) else {
            throw DecodingError.typeMismatch(type.self, .init(codingPath: codingPath,
                                                              debugDescription: "Type of value at \(key.stringValue) does not match to the expected type \(type)."))
        }
        return value
    }
    
    func decode(_ type: Int16.Type, forKey key: Key) throws -> Int16 {
        guard let stringValue = input[key.stringValue] else {
            throw DecodingError.keyNotFound(key, .init(codingPath: codingPath,
                                                       debugDescription: "Coding key \(key.stringValue) was not found."))
        }
        guard let value = Int16(stringValue) else {
            throw DecodingError.typeMismatch(type.self, .init(codingPath: codingPath,
                                                              debugDescription: "Type of value at \(key.stringValue) does not match to the expected type \(type)."))
        }
        return value
    }
    
    func decode(_ type: Int32.Type, forKey key: Key) throws -> Int32 {
        guard let stringValue = input[key.stringValue] else {
            throw DecodingError.keyNotFound(key, .init(codingPath: codingPath,
                                                       debugDescription: "Coding key \(key.stringValue) was not found."))
        }
        guard let value = Int32(stringValue) else {
            throw DecodingError.typeMismatch(type.self, .init(codingPath: codingPath,
                                                              debugDescription: "Type of value at \(key.stringValue) does not match to the expected type \(type)."))
        }
        return value
    }
    
    func decode(_ type: Int64.Type, forKey key: Key) throws -> Int64 {
        guard let stringValue = input[key.stringValue] else {
            throw DecodingError.keyNotFound(key, .init(codingPath: codingPath,
                                                       debugDescription: "Coding key \(key.stringValue) was not found."))
        }
        guard let value = Int64(stringValue) else {
            throw DecodingError.typeMismatch(type.self, .init(codingPath: codingPath,
                                                              debugDescription: "Type of value at \(key.stringValue) does not match to the expected type \(type)."))
        }
        return value
    }
    
    func decode(_ type: UInt.Type, forKey key: Key) throws -> UInt {
        guard let stringValue = input[key.stringValue] else {
            throw DecodingError.keyNotFound(key, .init(codingPath: codingPath,
                                                       debugDescription: "Coding key \(key.stringValue) was not found."))
        }
        guard let value = UInt(stringValue) else {
            throw DecodingError.typeMismatch(type.self, .init(codingPath: codingPath,
                                                              debugDescription: "Type of value at \(key.stringValue) does not match to the expected type \(type)."))
        }
        return value
    }
    
    func decode(_ type: UInt8.Type, forKey key: Key) throws -> UInt8 {
        guard let stringValue = input[key.stringValue] else {
            throw DecodingError.keyNotFound(key, .init(codingPath: codingPath,
                                                       debugDescription: "Coding key \(key.stringValue) was not found."))
        }
        guard let value = UInt8(stringValue) else {
            throw DecodingError.typeMismatch(type.self, .init(codingPath: codingPath,
                                                              debugDescription: "Type of value at \(key.stringValue) does not match to the expected type \(type)."))
        }
        return value
    }
    
    func decode(_ type: UInt16.Type, forKey key: Key) throws -> UInt16 {
        guard let stringValue = input[key.stringValue] else {
            throw DecodingError.keyNotFound(key, .init(codingPath: codingPath,
                                                       debugDescription: "Coding key \(key.stringValue) was not found."))
        }
        guard let value = UInt16(stringValue) else {
            throw DecodingError.typeMismatch(type.self, .init(codingPath: codingPath,
                                                              debugDescription: "Type of value at \(key.stringValue) does not match to the expected type \(type)."))
        }
        return value
    }
    
    func decode(_ type: UInt32.Type, forKey key: Key) throws -> UInt32 {
        guard let stringValue = input[key.stringValue] else {
            throw DecodingError.keyNotFound(key, .init(codingPath: codingPath,
                                                       debugDescription: "Coding key \(key.stringValue) was not found."))
        }
        guard let value = UInt32(stringValue) else {
            throw DecodingError.typeMismatch(type.self, .init(codingPath: codingPath,
                                                              debugDescription: "Type of value at \(key.stringValue) does not match to the expected type \(type)."))
        }
        return value
    }
    
    func decode(_ type: UInt64.Type, forKey key: Key) throws -> UInt64 {
        guard let stringValue = input[key.stringValue] else {
            throw DecodingError.keyNotFound(key, .init(codingPath: codingPath,
                                                       debugDescription: "Coding key \(key.stringValue) was not found."))
        }
        guard let value = UInt64(stringValue) else {
            throw DecodingError.typeMismatch(type.self, .init(codingPath: codingPath,
                                                              debugDescription: "Type of value at \(key.stringValue) does not match to the expected type \(type)."))
        }
        return value
    }
    
    func decode<T>(_ type: T.Type, forKey key: Key) throws -> T where T : Decodable {
        guard let dictionaryCodableType = type.self as? DictionaryCodable.Type else {
            throw DecodingError.dataCorrupted(.init(codingPath: codingPath,
                                                    debugDescription: "Decoding objects containing properties of object type is not supported.",
                                                    underlyingError: _DictionaryDecoder.DecodingError.objectToDecodeContainingPropertyOfObjectType))
        }
        guard let stringValue = input[key.stringValue] else {
            throw DecodingError.keyNotFound(key, .init(codingPath: codingPath,
                                                       debugDescription: "Coding key \(key.stringValue) was not found."))
        }
        guard let value = dictionaryCodableType.init(from: stringValue) else {
            throw DecodingError.typeMismatch(type.self, .init(codingPath: codingPath,
                                                              debugDescription: "Type of value at \(key.stringValue) does not match to the expected type \(type)."))
        }
        return value as! T
    }
    
    func decodeIfPresent(_ type: Bool.Type, forKey key: Key) throws -> Bool? {
        guard let stringValue = input[key.stringValue] else {
            throw DecodingError.keyNotFound(key, .init(codingPath: codingPath,
                                                       debugDescription: "Coding key \(key.stringValue) was not found."))
        }
        switch stringValue {
        case "null":
            return nil
        case "true":
            return true
        case "false":
            return false
        default:
            throw DecodingError.typeMismatch(type.self, .init(codingPath: codingPath,
                                                              debugDescription: "Type of value at \(key.stringValue) does not match to the expected type \(type)."))
        }
    }
    
    func decodeIfPresent(_ type: String.Type, forKey key: Key) throws -> String? {
        guard let value = input[key.stringValue] else {
            throw DecodingError.keyNotFound(key, .init(codingPath: codingPath,
                                                       debugDescription: "Coding key \(key.stringValue) was not found."))
        }
        if value == "null" {
            return nil
        } else {
            return value
        }
    }
    
    func decodeIfPresent(_ type: Double.Type, forKey key: Key) throws -> Double? {
        guard let stringValue = input[key.stringValue] else {
            throw DecodingError.keyNotFound(key, .init(codingPath: codingPath,
                                                       debugDescription: "Coding key \(key.stringValue) was not found."))
        }
        if stringValue == "null" {
            return nil
        } else {
            guard let value = Double(stringValue) else {
                throw DecodingError.typeMismatch(type.self, .init(codingPath: codingPath,
                                                                  debugDescription: "Type of value at \(key.stringValue) does not match to the expected type \(type)."))
            }
            return value
        }
    }
    
    func decodeIfPresent(_ type: Float.Type, forKey key: Key) throws -> Float? {
        guard let stringValue = input[key.stringValue] else {
            throw DecodingError.keyNotFound(key, .init(codingPath: codingPath,
                                                       debugDescription: "Coding key \(key.stringValue) was not found."))
        }
        if stringValue == "null" {
            return nil
        } else {
            guard let value = Float(stringValue) else {
                throw DecodingError.typeMismatch(type.self, .init(codingPath: codingPath,
                                                                  debugDescription: "Type of value at \(key.stringValue) does not match to the expected type \(type)."))
            }
            return value
        }
    }
    
    func decodeIfPresent(_ type: Int.Type, forKey key: Key) throws -> Int? {
        guard let stringValue = input[key.stringValue] else {
            throw DecodingError.keyNotFound(key, .init(codingPath: codingPath,
                                                       debugDescription: "Coding key \(key.stringValue) was not found."))
        }
        if stringValue == "null" {
            return nil
        } else {
            guard let value = Int(stringValue) else {
                throw DecodingError.typeMismatch(type.self, .init(codingPath: codingPath,
                                                                  debugDescription: "Type of value at \(key.stringValue) does not match to the expected type \(type)."))
            }
            return value
        }
    }
    
    func decodeIfPresent(_ type: Int8.Type, forKey key: Key) throws -> Int8? {
        guard let stringValue = input[key.stringValue] else {
            throw DecodingError.keyNotFound(key, .init(codingPath: codingPath,
                                                       debugDescription: "Coding key \(key.stringValue) was not found."))
        }
        if stringValue == "null" {
            return nil
        } else {
            guard let value = Int8(stringValue) else {
                throw DecodingError.typeMismatch(type.self, .init(codingPath: codingPath,
                                                                  debugDescription: "Type of value at \(key.stringValue) does not match to the expected type \(type)."))
            }
            return value
        }
    }
    
    func decodeIfPresent(_ type: Int16.Type, forKey key: Key) throws -> Int16? {
        guard let stringValue = input[key.stringValue] else {
            throw DecodingError.keyNotFound(key, .init(codingPath: codingPath,
                                                       debugDescription: "Coding key \(key.stringValue) was not found."))
        }
        if stringValue == "null" {
            return nil
        } else {
            guard let value = Int16(stringValue) else {
                throw DecodingError.typeMismatch(type.self, .init(codingPath: codingPath,
                                                                  debugDescription: "Type of value at \(key.stringValue) does not match to the expected type \(type)."))
            }
            return value
        }
    }
    
    func decodeIfPresent(_ type: Int32.Type, forKey key: Key) throws -> Int32? {
        guard let stringValue = input[key.stringValue] else {
            throw DecodingError.keyNotFound(key, .init(codingPath: codingPath,
                                                       debugDescription: "Coding key \(key.stringValue) was not found."))
        }
        if stringValue == "null" {
            return nil
        } else {
            guard let value = Int32(stringValue) else {
                throw DecodingError.typeMismatch(type.self, .init(codingPath: codingPath,
                                                                  debugDescription: "Type of value at \(key.stringValue) does not match to the expected type \(type)."))
            }
            return value
        }
    }
    
    func decodeIfPresent(_ type: Int64.Type, forKey key: Key) throws -> Int64? {
        guard let stringValue = input[key.stringValue] else {
            throw DecodingError.keyNotFound(key, .init(codingPath: codingPath,
                                                       debugDescription: "Coding key \(key.stringValue) was not found."))
        }
        if stringValue == "null" {
            return nil
        } else {
            guard let value = Int64(stringValue) else {
                throw DecodingError.typeMismatch(type.self, .init(codingPath: codingPath,
                                                                  debugDescription: "Type of value at \(key.stringValue) does not match to the expected type \(type)."))
            }
            return value
        }
    }
    
    func decodeIfPresent(_ type: UInt.Type, forKey key: Key) throws -> UInt? {
        guard let stringValue = input[key.stringValue] else {
            throw DecodingError.keyNotFound(key, .init(codingPath: codingPath,
                                                       debugDescription: "Coding key \(key.stringValue) was not found."))
        }
        if stringValue == "null" {
            return nil
        } else {
            guard let value = UInt(stringValue) else {
                throw DecodingError.typeMismatch(type.self, .init(codingPath: codingPath,
                                                                  debugDescription: "Type of value at \(key.stringValue) does not match to the expected type \(type)."))
            }
            return value
        }
    }
    
    func decodeIfPresent(_ type: UInt8.Type, forKey key: Key) throws -> UInt8? {
        guard let stringValue = input[key.stringValue] else {
            throw DecodingError.keyNotFound(key, .init(codingPath: codingPath,
                                                       debugDescription: "Coding key \(key.stringValue) was not found."))
        }
        if stringValue == "null" {
            return nil
        } else {
            guard let value = UInt8(stringValue) else {
                throw DecodingError.typeMismatch(type.self, .init(codingPath: codingPath,
                                                                  debugDescription: "Type of value at \(key.stringValue) does not match to the expected type \(type)."))
            }
            return value
        }
    }
    
    func decodeIfPresent(_ type: UInt16.Type, forKey key: Key) throws -> UInt16? {
        guard let stringValue = input[key.stringValue] else {
            throw DecodingError.keyNotFound(key, .init(codingPath: codingPath,
                                                       debugDescription: "Coding key \(key.stringValue) was not found."))
        }
        if stringValue == "null" {
            return nil
        } else {
            guard let value = UInt16(stringValue) else {
                throw DecodingError.typeMismatch(type.self, .init(codingPath: codingPath,
                                                                  debugDescription: "Type of value at \(key.stringValue) does not match to the expected type \(type)."))
            }
            return value
        }
    }
    
    func decodeIfPresent(_ type: UInt32.Type, forKey key: Key) throws -> UInt32? {
        guard let stringValue = input[key.stringValue] else {
            throw DecodingError.keyNotFound(key, .init(codingPath: codingPath,
                                                       debugDescription: "Coding key \(key.stringValue) was not found."))
        }
        if stringValue == "null" {
            return nil
        } else {
            guard let value = UInt32(stringValue) else {
                throw DecodingError.typeMismatch(type.self, .init(codingPath: codingPath,
                                                                  debugDescription: "Type of value at \(key.stringValue) does not match to the expected type \(type)."))
            }
            return value
        }
    }
    
    func decodeIfPresent(_ type: UInt64.Type, forKey key: Key) throws -> UInt64? {
        guard let stringValue = input[key.stringValue] else {
            throw DecodingError.keyNotFound(key, .init(codingPath: codingPath,
                                                       debugDescription: "Coding key \(key.stringValue) was not found."))
        }
        if stringValue == "null" {
            return nil
        } else {
            guard let value = UInt64(stringValue) else {
                throw DecodingError.typeMismatch(type.self, .init(codingPath: codingPath,
                                                                  debugDescription: "Type of value at \(key.stringValue) does not match to the expected type \(type)."))
            }
            return value
        }
    }
    
    func decodeIfPresent<T>(_ type: T.Type, forKey key: Key) throws -> T? where T : Decodable {
        guard let dictionaryCodableType = type.self as? DictionaryCodable.Type else {
            throw DecodingError.dataCorrupted(.init(codingPath: codingPath,
                                                    debugDescription: "Decoding objects containing properties of object type is not supported.",
                                                    underlyingError: _DictionaryDecoder.DecodingError.objectToDecodeContainingPropertyOfObjectType))
        }
        guard let stringValue = input[key.stringValue] else {
            throw DecodingError.keyNotFound(key, .init(codingPath: codingPath,
                                                       debugDescription: "Coding key \(key.stringValue) was not found."))
        }
        if stringValue == "null" {
            return nil
        } else {
            guard let value = dictionaryCodableType.init(from: stringValue) else {
                throw DecodingError.typeMismatch(type.self, .init(codingPath: codingPath,
                                                                  debugDescription: "Type of value at \(key.stringValue) does not match to the expected type \(type)."))
            }
            return (value as! T)
        }
    }
    
    func nestedContainer<NestedKey>(keyedBy type: NestedKey.Type, forKey key: Key) throws -> KeyedDecodingContainer<NestedKey> where NestedKey : CodingKey {
        let dictionaryKeyedDecodingContainer = _DictionaryKeyedDecodingContainer<NestedKey>(input: input,
                                                                                          codingPath: codingPath + [key])
        return KeyedDecodingContainer(dictionaryKeyedDecodingContainer)
    }
    
    func nestedUnkeyedContainer(forKey key: Key) throws -> UnkeyedDecodingContainer {
        _DictionaryUnkeyedDecodingContainer(codingPath: codingPath)
    }
    
    func superDecoder() throws -> Decoder {
        try superDecoder(forKey: Key(stringValue: "super")!)
    }
    
    func superDecoder(forKey key: Key) throws -> Decoder {
        _DictionaryDecoder(codingPath: codingPath + [key])
    }
}
