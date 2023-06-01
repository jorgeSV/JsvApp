//
//  SimplePaginatedListTests.swift
//  JsvAppTests
//
//  Created by jorgeSV on 23/2/23.
//  Copyright © 2023 JSV. All rights reserved.
//

import XCTest
@testable import JsvApp

final class SimplePaginatedListTests: XCTestCase {
    
    func testSimplePaginatedList() {
        // Given
        let count = 10
        let pages = 5
        let next = "https://example.com/page=2"
        let info = SimpleInfo(count: count, pages: pages, next: next)
        let item1 = SimpleListItem(id: 1, name: "Item 1", description: "Description 1", listTitle: nil, list: [], status: nil, type: nil, image: nil)
        let item2 = SimpleListItem(id: 2, name: "Item 2", description: "Description 2", listTitle: nil, list: [], status: nil, type: nil, image: nil)
        let results = [item1, item2]
        
        // When
        let simplePaginatedList = SimplePaginatedList(info: info, results: results)
        
        // Then
        XCTAssertEqual(simplePaginatedList.info?.count, 10)
        XCTAssertEqual(simplePaginatedList.info?.pages, 5)
        XCTAssertEqual(simplePaginatedList.info?.next, "https://example.com/page=2")
        XCTAssertEqual(simplePaginatedList.results?.count, 2)
        XCTAssertEqual(simplePaginatedList.results?[0].name, "Item 1")
        XCTAssertEqual(simplePaginatedList.results?[1].name, "Item 2")
    }
    
    func testSimplePaginatedListWithNilValues() {
        // Given
        let info: SimpleInfo? = nil
        let results: [SimpleListItem] = []
        
        // When
        let simplePaginatedList = SimplePaginatedList<SimpleListItem>(info: info, results: results)
        
        // Then
        XCTAssertNil(simplePaginatedList.info)
        XCTAssertNotNil(simplePaginatedList.results)
    }
}

final class SimpleInfoTests: XCTestCase {
    
    func testSimpleInfo() {
        // Given
        let count = 10
        let pages = 5
        let next = "https://example.com/page=2"
        
        // When
        let simpleInfo = SimpleInfo(count: count, pages: pages, next: next)
        
        // Then
        XCTAssertEqual(simpleInfo.count, 10)
        XCTAssertEqual(simpleInfo.pages, 5)
        XCTAssertEqual(simpleInfo.next, "https://example.com/page=2")
    }
    
    func testSimpleInfoWithNilValues() {
        // Given + When
        let simpleInfo = SimpleInfo(count: nil, pages: nil, next: nil)
        
        // Then
        XCTAssertNil(simpleInfo.count)
        XCTAssertNil(simpleInfo.pages)
        XCTAssertNil(simpleInfo.next)
    }
}
