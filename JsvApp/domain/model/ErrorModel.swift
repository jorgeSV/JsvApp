//
//  ErrorModel.swift
//  JsvApp
//
//  Created by jorgeSV on 16/2/23.
//  Copyright © 2023 JSV. All rights reserved.
//

import Foundation

public struct ErrorModel: Error, StructCodable {
    let code: String?
    let message: String?
    let description: String?
    let httpCode: Int?
    let httpMessage: String?
    
    enum CodingKeys: String, CodingKey {
        case code
        case message
        case description
        case httpCode
        case httpMessage
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        code = try container.decodeIfPresent(String.self, forKey: .code)
        message = try container.decodeIfPresent(String.self, forKey: .message)
        description = try container.decodeIfPresent(String.self, forKey: .description)
        httpCode = try container.decodeIfPresent(Int.self, forKey: .httpCode)
        httpMessage = try container.decodeIfPresent(String.self, forKey: .httpMessage)
    }

    public init(code: String,
                message: String,
                description: String,
                httpCode: Int? = nil,
                httpMessage: String = "") {
        self.code = code
        self.message = message
        self.description = description
        self.httpCode = httpCode
        self.httpMessage = httpMessage
    }
    
    public init(description: String) {
        self.init(code: "", message: "", description: description)
    }
}
