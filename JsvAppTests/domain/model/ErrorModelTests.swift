//
//  ErrorModelTests.swift
//  JsvAppTests
//
//  Created by jorgeSV on 23/2/23.
//  Copyright © 2023 JSV. All rights reserved.
//

import XCTest
@testable import JsvApp

final class ErrorModelTests: XCTestCase {
    
    func testErrorModelInitialization() {
        // Given + When
        let errorModel = ErrorModel(code: "404", message: "Not Found", description: "The requested resource was not found.")
        
        // Then
        XCTAssertEqual(errorModel.code, "404")
        XCTAssertEqual(errorModel.message, "Not Found")
        XCTAssertEqual(errorModel.description, "The requested resource was not found.")
        XCTAssertNil(errorModel.httpCode)
        XCTAssertEqual(errorModel.httpMessage, "")
    }
    
    func testErrorModelInitializationWithAllValues() {
        // Given + When
        let errorModel = ErrorModel(code: "500", message: "Internal Server Error", description: "An error occurred on the server.", httpCode: 500, httpMessage: "Server Error")
        
        // Then
        XCTAssertEqual(errorModel.code, "500")
        XCTAssertEqual(errorModel.message, "Internal Server Error")
        XCTAssertEqual(errorModel.description, "An error occurred on the server.")
        XCTAssertEqual(errorModel.httpCode, 500)
        XCTAssertEqual(errorModel.httpMessage, "Server Error")
    }
    
    func testErrorModelInitializationWithDescription() {
        // Given + When
        let errorModel = ErrorModel(description: "An error occurred.")
        
        // Then
        XCTAssertEqual(errorModel.code, "")
        XCTAssertEqual(errorModel.message, "")
        XCTAssertEqual(errorModel.description, "An error occurred.")
        XCTAssertNil(errorModel.httpCode)
        XCTAssertEqual(errorModel.httpMessage, "")
    }
    
    func testErrorModelDecoding() throws {
        // Given
        let jsonString = """
        {
            "code": "400",
            "message": "Bad Request",
            "description": "The request is invalid.",
            "httpCode": 400,
            "httpMessage": "Bad Request"
        }
        """
        
        // When
        let jsonData = jsonString.data(using: .utf8)!
        let errorModel = try JSONDecoder().decode(ErrorModel.self, from: jsonData)
        
        // Then
        XCTAssertEqual(errorModel.code, "400")
        XCTAssertEqual(errorModel.message, "Bad Request")
        XCTAssertEqual(errorModel.description, "The request is invalid.")
        XCTAssertEqual(errorModel.httpCode, 400)
        XCTAssertEqual(errorModel.httpMessage, "Bad Request")
    }
}
