//
//  RamBaseLocationTests.swift
//  JsvAppTests
//
//  Created by jorgeSV on 23/2/23.
//  Copyright © 2023 JSV. All rights reserved.
//

import XCTest
@testable import JsvApp

final class RamBaseLocationTests: XCTestCase {

    func testRamBaseLocationSerialization() throws {
        // Given
        let expectedName = "Test name"
        let expectedUrl = "https://example.com"
        let ramBaseLocation = RamBaseLocation(name: expectedName, url: expectedUrl)

        // When
        let encodedData = try JSONEncoder().encode(ramBaseLocation)
        let decodedRamBaseLocation = try JSONDecoder().decode(RamBaseLocation.self, from: encodedData)

        // Then
        XCTAssertEqual(decodedRamBaseLocation.name, expectedName)
        XCTAssertEqual(decodedRamBaseLocation.url, expectedUrl)
    }
}
