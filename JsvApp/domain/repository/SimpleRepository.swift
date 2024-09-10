//  
//  SimpleRepository.swift
//  JsvApp
//
//  Created by jorgeSV on 17/2/23.
//  Copyright © 2023 JSV. All rights reserved.
//

import Foundation

@MainActor
public class SimpleRepository: @preconcurrency SimpleRepositoryProtocol {
    
    // MARK: - Singleton
    
    public static let shared: SimpleRepositoryProtocol = SimpleRepository()
    
    // MARK: Properties
    
    let ramApi: RamAPIDataSourceProtocol
    
    // MARK: - Initializer
    
    private init(ramApi: RamAPIDataSourceProtocol = RamAPIDataSource.shared) {
        self.ramApi = ramApi
    }
    
    // MARK: SimpleRepository functions
    
    public func getItems(url: String?, completion: @escaping SimpleItemsResult) {
        
        ramApi.getCharacters(url: url, completion: { result in
            switch result {
            case .success(let data):
                completion(.success(data.convertToSimplePaginatedList()))
            
            case .failure(let error):
                completion(ResultResponse.error(error))
            }
        })
    }
}
