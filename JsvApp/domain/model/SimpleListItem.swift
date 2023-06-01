//
//  SimpleListItem.swift
//  JsvApp
//
//  Created by jorgeSV on 17/2/23.
//  Copyright © 2023 JSV. All rights reserved.
//

import Foundation

public protocol SimpleListItemProtocol {
    func convertToSimpleListItem() -> SimpleListItem
}

public struct SimpleListItem {
    let id : Int
    let name : String
    let description: String?
    let listTitle: String?
    let list: [String]?
    let status : String?
    let type : String?
    let image : String?
}
