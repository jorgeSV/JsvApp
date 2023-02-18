//  
//  RamAPIDataSource.swift
//  JsvApp
//
//  Created by jorgeSV on 16/2/23.
//  Copyright © 2023 JSV. All rights reserved.
//
//

import Foundation
import Alamofire

class RamAPIDataSource: BaseDataSource, RamAPIDataSourceProtocol {
    
    // MARK: - Singleton
    
    public static let shared: RamAPIDataSourceProtocol = RamAPIDataSource()
    
    // MARK: - Private Init
    
    private override init() {}
    
    // MARK: - RamAPIDataSource functions
    
    func getCharacters(url: String?, completion: @escaping RamCharactersResult) {
        
        var request = RamAPINetworkRequests.getCharacters.path
        
        if let url = url, !url.isEmpty {
            request = url
        }
        
        executeRequest(request, method: .get, parameters: nil) { result in
            
            switch result {
            case .success(let data):
                if let data = data, let model = RamPaginatedList<RamCharacter>.getModelFrom(data) {
                    completion(.success(model))
                } else {
                    completion(.failure(.init(description: "Error parsing RamPaginatedList model")))
                }
                
            case .error(let error):
                completion(.failure(error))
            }
        }
    }
}
