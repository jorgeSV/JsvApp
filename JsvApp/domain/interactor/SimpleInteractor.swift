//  
//  SimpleInteractor.swift
//  JsvApp
//
//  Created by jorgeSV on 17/2/23.
//  Copyright © 2023 JSV. All rights reserved.
//

import Foundation

class SimpleInteractor: SimpleInteractorProtocol {
    
    // MARK: - Properties
    
    let simpleRepository: SimpleRepositoryProtocol
    
    // MARK: - Init
    
    public init(simpleRepository: SimpleRepositoryProtocol) {
        self.simpleRepository = simpleRepository
    }
    
    // MARK: - SimpleInteractor functions
    
    func getItems(url: String?, completion: @escaping SimpleItemsResult) {
        simpleRepository.getItems(url: url) { result in
            switch result {
            case .success(let model):
                completion(.success(model))
                
            case .error(let error):
                completion(.error(error))
            }
        }
    }
    
}
