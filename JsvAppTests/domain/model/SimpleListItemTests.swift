//
//  SimpleListItemTests.swift
//  JsvAppTests
//
//  Created by jorgeSV on 23/2/23.
//  Copyright © 2023 JSV. All rights reserved.
//

import XCTest
@testable import JsvApp

final class SimpleListItemTests: XCTestCase {
    
    func testSimpleListItem() {
        // Given
        let id = 123
        let name = "Example Item"
        let description = "This is an example item"
        let listTitle = "Episodes"
        let list = ["Example description 1", "Example description 2"]
        let status = "active"
        let type = "basic"
        let image = "https://example.com/item.jpg"
        
        // When
        let simpleListItem = SimpleListItem(id: id,
                                            name: name,
                                            description: description,
                                            listTitle: listTitle,
                                            list: list,
                                            status: status,
                                            type: type,
                                            image: image)
        
        // Then
        XCTAssertEqual(simpleListItem.id, 123)
        XCTAssertEqual(simpleListItem.name, "Example Item")
        XCTAssertEqual(simpleListItem.description, "This is an example item")
        XCTAssertEqual(simpleListItem.listTitle, "Episodes")
        XCTAssertEqual(simpleListItem.list, ["Example description 1", "Example description 2"])
        XCTAssertEqual(simpleListItem.status, "active")
        XCTAssertEqual(simpleListItem.type, "basic")
        XCTAssertEqual(simpleListItem.image, "https://example.com/item.jpg")
    }
    
    func testSimpleListItemWithNilValues() {
        // Given
        let id = 123
        let name = "Example Item"
        
        // When
        let simpleListItem = SimpleListItem(id: id,
                                            name: name,
                                            description: nil,
                                            listTitle: nil,
                                            list: nil,
                                            status: nil,
                                            type: nil,
                                            image: nil)
        
        // Then
        XCTAssertEqual(simpleListItem.id, 123)
        XCTAssertEqual(simpleListItem.name, "Example Item")
        XCTAssertNil(simpleListItem.description)
        XCTAssertNil(simpleListItem.listTitle)
        XCTAssertNil(simpleListItem.list)
        XCTAssertNil(simpleListItem.status)
        XCTAssertNil(simpleListItem.type)
        XCTAssertNil(simpleListItem.image)
    }
}

