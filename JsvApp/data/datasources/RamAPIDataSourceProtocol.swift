//  
//  RamAPIDataSourceProtocol.swift
//  JsvApp
//
//  Created by jorgeSV on 16/2/23.
//  Copyright © 2023 JSV. All rights reserved.
//
//

import Foundation

public typealias RamCharactersResult = (Result<RamPaginatedList<RamCharacter>, ErrorModel>) -> Void

let API_BASE_URL = "https://rickandmortyapi.com/api"

public protocol RamAPIDataSourceProtocol where Self: BaseDataSource {
    func getCharacters(url: String?, completion: @escaping RamCharactersResult)
}

public enum RamAPINetworkRequests {
    case getCharacters
    case getCharacterDetail(characterID: Int)
}

extension RamAPINetworkRequests {
    
    public var path: String {
        switch self {
        case .getCharacters:
            return API_BASE_URL + "/character"
        
        case .getCharacterDetail(let characterID):
            return API_BASE_URL + "/character/\(characterID)"
        }
    }
}
