//  DictionaryCoding.swift
//  Created by Václav Brož on 31/1/2023

@testable import DictionaryCoding
import XCTest

final class DictionaryCodingXCTestCase: XCTestCase {
    // MARK: - Constants -
    private static let OBJECT_CONTAINING_ARRAY = ObjectContainingArray(arrayProperty: ["first element", "second element"])
    private static let DICTIONARY_DATA_OF_OBJECT_CONTAINING_ARRAY = ["arrayProperty[0]": "first element", "arrayProperty[1]": "second element"]
    private static let SINGLE_VALUE = "single value"
    private static let DICTIONARY_DATAT_OF_SINGLE_VALUE = ["": "single value"]
    private static let OBJECT_CONTAINING_PROPERTY_OF_OBJECT_TYPE = ObjectContainingPropertyOfObjectType(propertyOfObjectType: .init(property: "property"))
    private static let DICTIONARY_DATA_OF_OBJECT_CONTAINING_PROPERTY_OF_OBJECT_TYPE = ["\(ObjectContainingPropertyOfObjectType.CodingKeys.propertyOfObjectType.stringValue).\(ObjectContainingPropertyOfObjectType.Object.CodingKeys.property.stringValue)": "property"]
    private static let OBJECT = Object(integerProperty: 3647,
                                       optionalIntegerProperty: nil,
                                       stringProperty: "property",
                                       optinalStringProperty: nil,
                                       booleanProperty: true,
                                       optionalBooleanProperty: nil,
                                       dictionaryCodableObjectProperty: .init(property: "string codable object property"),
                                       optionalDictionaryCodableObjectProperty: nil)
    
    // MARK: - Tests -
    func testArrayEncoding() {
        XCTAssertThrowsError(try DictionaryEncoder().encode([DictionaryCodingXCTestCase.OBJECT_CONTAINING_ARRAY]))
    }
    
    func testArrayDecoding() throws {
        XCTAssertThrowsError(try DictionaryDecoder().decode(ObjectContainingArray.self, from: DictionaryCodingXCTestCase.DICTIONARY_DATA_OF_OBJECT_CONTAINING_ARRAY))
    }
    
    func testSingleValueEncoding() {
        XCTAssertThrowsError(try DictionaryEncoder().encode(DictionaryCodingXCTestCase.SINGLE_VALUE))
    }
    
    func testSingleValueDecoding() {
        XCTAssertThrowsError(try DictionaryDecoder().decode(String.self, from: DictionaryCodingXCTestCase.DICTIONARY_DATAT_OF_SINGLE_VALUE))
    }
    
    func testObjectContainingPropertyOfObjectTypeEncoding() {
        XCTAssertThrowsError(try DictionaryEncoder().encode(DictionaryCodingXCTestCase.OBJECT_CONTAINING_PROPERTY_OF_OBJECT_TYPE))
    }
    
    func testObjectContainingPropertyOfObjectTypeDecoding() {
        XCTAssertThrowsError(try DictionaryDecoder().decode(ObjectContainingPropertyOfObjectType.self, from: DictionaryCodingXCTestCase.DICTIONARY_DATA_OF_OBJECT_CONTAINING_PROPERTY_OF_OBJECT_TYPE))
    }
    
    func testObjectCoding() throws {
        let dictionaryDataOfObject = try DictionaryEncoder().encode(DictionaryCodingXCTestCase.OBJECT)
        let object = try DictionaryDecoder().decode(Object.self, from: dictionaryDataOfObject)
        XCTAssertEqual(object, DictionaryCodingXCTestCase.OBJECT)
    }
    
    // MARK: - Nested Types -
    private struct ObjectContainingArray: Codable {
        let arrayProperty: [String]
    }
    
    private struct ObjectContainingPropertyOfObjectType: Codable {
        let propertyOfObjectType: Object
        
        struct Object: Codable {
            let property: String
            
            enum CodingKeys: String, CodingKey {
                case property
            }
        }
        
        enum CodingKeys: String, CodingKey {
            case propertyOfObjectType
        }
    }
    
    private struct Object: Codable, Equatable {
        let integerProperty: Int
        let optionalIntegerProperty: Int?
        let stringProperty: String
        let optinalStringProperty: String?
        let booleanProperty: Bool
        let optionalBooleanProperty: Bool?
        let dictionaryCodableObjectProperty: DictionaryCodableObject
        let optionalDictionaryCodableObjectProperty: DictionaryCodableObject?
        
        static func == (lhs: DictionaryCodingXCTestCase.Object, rhs: DictionaryCodingXCTestCase.Object) -> Bool {
            (lhs.integerProperty == rhs.integerProperty)
            && (lhs.optionalIntegerProperty == rhs.optionalIntegerProperty)
            && (lhs.stringProperty == rhs.stringProperty)
            && (lhs.optinalStringProperty == rhs.optinalStringProperty)
            && (lhs.booleanProperty == rhs.booleanProperty)
            && (lhs.optionalBooleanProperty == rhs.optionalBooleanProperty)
            && (lhs.dictionaryCodableObjectProperty == rhs.dictionaryCodableObjectProperty)
            && (lhs.optionalDictionaryCodableObjectProperty == rhs.optionalDictionaryCodableObjectProperty)
        }
        
        struct DictionaryCodableObject: DictionaryCodable, Equatable {
            let property: String
            
            init(property: String) {
                self.property = property
            }
            
            init?(from string: String) {
                self.init(property: string)
            }
            
            var string: String {
                property
            }
            
            var description: String {
                property
            }
        }
    }
}
