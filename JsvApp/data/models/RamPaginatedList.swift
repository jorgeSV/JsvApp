//
//  RamPaginatedList.swift
//  JsvApp
//
//  Created by jorgeSV on 16/2/23.
//  Copyright © 2023 JSV. All rights reserved.
//
//

import Foundation

public struct RamPaginatedList <T:StructCodable> : StructCodable, SimplePaginatedListProtocol {
    let info : RamInfo?
    let results : [T]?
    
    public func convertToSimplePaginatedList() -> SimplePaginatedList<SimpleListItem> {
        SimplePaginatedList(info: info?.convertToSimpleInfo(), results: results?.compactMap({
            if let item = $0 as? SimpleListItemProtocol {
                return item.convertToSimpleListItem()
            }
            return SimpleListItem(id: 0, name: "", description: nil, descriptions: nil, status: nil, type: nil, image: nil)
        }))
    }
}

public struct RamInfo : StructCodable, SimpleInfoProtocol {
    let count : Int?
    let pages : Int?
    let next : String?
    let prev : String?
    
    public func convertToSimpleInfo() -> SimpleInfo {
        SimpleInfo(count: count, pages: pages, next: next)
    }
}
