//
//  SimplePaginatedList.swift
//  JsvApp
//
//  Created by jorgeSV on 17/2/23.
//  Copyright © 2023 JSV. All rights reserved.
//

import Foundation

public protocol SimplePaginatedListProtocol {
    func convertToSimplePaginatedList() -> SimplePaginatedList<SimpleListItem>
}

public struct SimplePaginatedList <T> {
    let info : SimpleInfo?
    let results : [T]?
}

public protocol SimpleInfoProtocol {
    func convertToSimpleInfo() -> SimpleInfo
}

public struct SimpleInfo {
    let count : Int?
    let pages : Int?
    let next : String?
}
