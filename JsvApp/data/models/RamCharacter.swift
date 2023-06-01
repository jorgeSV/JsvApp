//
//  RamCharacter.swift
//  JsvApp
//
//  Created by jorgeSV on 16/2/23.
//  Copyright © 2023 JSV. All rights reserved.
//
//

import Foundation

public struct RamCharacter : StructCodable, SimpleListItemProtocol {
    let id : Int?
    let name : String?
    let status : String?
    let species : String?
    let type : String?
    let gender : String?
    let origin : RamBaseLocation?
    let location : RamBaseLocation?
    let image : String?
    let episode : [String]?
    let url : String?
    let created : String?
    
    public func convertToSimpleListItem() -> SimpleListItem {
        SimpleListItem(id: id ?? 0,
                       name: name ?? "",
                       description: "",
                       listTitle: "Episodes",
                       list: episode,
                       status: status,
                       type: type,
                       image: image)
    }
}
