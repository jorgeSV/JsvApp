//  
//  SimpleRepositoryProtocol.swift
//  JsvApp
//
//  Created by jorgeSV on 17/2/23.
//  Copyright © 2023 JSV. All rights reserved.
//

import Foundation

public typealias SimpleItemsResult = (ResultResponse<SimplePaginatedList<SimpleListItem>>) -> Void

public protocol SimpleRepositoryProtocol {
    func getItems(url: String?, completion: @escaping SimpleItemsResult)
}

