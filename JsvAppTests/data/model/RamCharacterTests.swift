//
//  RamCharacterTests.swift
//  JsvAppTests
//
//  Created by jorgeSV on 23/2/23.
//  Copyright © 2023 JSV. All rights reserved.
//

import XCTest
@testable import JsvApp

final class RamCharacterTests: XCTestCase {

    func testConvertToSimpleListItem() {
        // Given
        let ramCharacter = RamCharacter(id: 1,
                                        name: "Rick Sanchez",
                                        status: "Alive",
                                        species: "Human",
                                        type: "Unknown",
                                        gender: "Male",
                                        origin: RamBaseLocation(name: "Earth",
                                                                url: "https://rickandmortyapi.com/api/location/1"),
                                        location: RamBaseLocation(name: "Earth",
                                                                  url: "https://rickandmortyapi.com/api/location/20"),
                                        image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg",
                                        episode: ["https://rickandmortyapi.com/api/episode/1"],
                                        url: "https://rickandmortyapi.com/api/character/1",
                                        created: "2017-11-04T18:48:46.250Z")
        
        // When
        let simpleListItem = ramCharacter.convertToSimpleListItem()
        
        // Then
        XCTAssertEqual(simpleListItem.id, 1)
        XCTAssertEqual(simpleListItem.name, "Rick Sanchez")
        XCTAssertEqual(simpleListItem.description, "")
        XCTAssertEqual(simpleListItem.list, ["https://rickandmortyapi.com/api/episode/1"])
        XCTAssertEqual(simpleListItem.status, "Alive")
        XCTAssertEqual(simpleListItem.type, "Unknown")
        XCTAssertEqual(simpleListItem.image, "https://rickandmortyapi.com/api/character/avatar/1.jpeg")
    }
    
    func testRamCharacterSerialization() throws {
        // Given
        let character = RamCharacter(id: 1,
                                     name: "Rick",
                                     status: "Alive",
                                     species: "Human",
                                     type: "",
                                     gender: "Male",
                                     origin: nil,
                                     location: nil,
                                     image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg",
                                     episode: [],
                                     url: "",
                                     created: "")
        
        // When
        let encoder = JSONEncoder()
        let jsonData = try encoder.encode(character)
        let jsonString = String(data: jsonData, encoding: .utf8)
        
        let decoder = JSONDecoder()
        let characterFromJson = try decoder.decode(RamCharacter.self, from: jsonData)
        
        // Then
        XCTAssertNotNil(jsonString)
        
        XCTAssertEqual(character.id, characterFromJson.id)
        XCTAssertEqual(character.name, characterFromJson.name)
        XCTAssertEqual(character.status, characterFromJson.status)
        XCTAssertEqual(character.species, characterFromJson.species)
        XCTAssertEqual(character.type, characterFromJson.type)
        XCTAssertEqual(character.gender, characterFromJson.gender)
        XCTAssertEqual(character.image, characterFromJson.image)
        XCTAssertEqual(character.episode, characterFromJson.episode)
        XCTAssertEqual(character.url, characterFromJson.url)
        XCTAssertEqual(character.created, characterFromJson.created)
    }

}
