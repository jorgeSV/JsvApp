//
//  RamPaginatedListTests.swift
//  JsvAppTests
//
//  Created by jorgeSV on 23/2/23.
//  Copyright © 2023 JSV. All rights reserved.
//

import XCTest
@testable import JsvApp

final class RamPaginatedListTests: XCTestCase {
    
    func testRamPaginatedListSerialization() {
        // Given
        let ramCharacter = RamCharacter(id: 1,
                                        name: "Test Character",
                                        status: "Alive",
                                        species: "Human",
                                        type: nil,
                                        gender: "Female",
                                        origin: nil,
                                        location: nil,
                                        image: nil,
                                        episode: nil,
                                        url: nil,
                                        created: nil)
        
        // When
        let ramPaginatedList = RamPaginatedList(info: RamInfo(count: 1,
                                                              pages: 1,
                                                              next: nil,
                                                              prev: nil),
                                                results: [ramCharacter])
        
        let encoder = JSONEncoder()
        guard let encodedData = try? encoder.encode(ramPaginatedList) else {
            XCTFail("Failed to encode ramPaginatedList")
            return
        }
        
        let decoder = JSONDecoder()
        guard let decodedRamPaginatedList = try? decoder.decode(RamPaginatedList<RamCharacter>.self, from: encodedData) else {
            XCTFail("Failed to decode RamPaginatedList")
            return
        }
        
        // Then
        XCTAssertEqual(decodedRamPaginatedList.info?.count, ramPaginatedList.info?.count)
        XCTAssertEqual(decodedRamPaginatedList.info?.pages, ramPaginatedList.info?.pages)
        XCTAssertEqual(decodedRamPaginatedList.results?.count, ramPaginatedList.results?.count)
        XCTAssertEqual(decodedRamPaginatedList.results?.first?.name, ramPaginatedList.results?.first?.name)
    }
}

final class RamInfoTests: XCTestCase {
    
    func testRamInfoSerialization() {
        // Given
        let ramInfo = RamInfo(count: 1,
                              pages: 1,
                              next: nil,
                              prev: nil)
        
        // When
        let encoder = JSONEncoder()
        guard let encodedData = try? encoder.encode(ramInfo) else {
            XCTFail("Failed to encode ramInfo")
            return
        }
        
        let decoder = JSONDecoder()
        guard let decodedRamInfo = try? decoder.decode(RamInfo.self, from: encodedData) else {
            XCTFail("Failed to decode RamInfo")
            return
        }
        
        // Then
        XCTAssertEqual(decodedRamInfo.count, ramInfo.count)
        XCTAssertEqual(decodedRamInfo.pages, ramInfo.pages)
    }
}
