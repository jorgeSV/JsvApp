//  
//  SimpleInteractorProtocol.swift
//  JsvApp
//
//  Created by jorgeSV on 17/2/23.
//  Copyright © 2023 JSV. All rights reserved.
//

import Foundation

public protocol SimpleInteractorProtocol {
    func getItems(url: String?, completion: @escaping SimpleItemsResult)
}
