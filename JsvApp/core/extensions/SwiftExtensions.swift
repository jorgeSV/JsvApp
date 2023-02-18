//
//  SwiftExtensions.swift
//  JsvApp
//
//  Created by jorgeSV on 16/2/23.
//  Copyright © 2023 JSV. All rights reserved.
//

import Foundation

public protocol StructCodable: Codable {
    static func getModelFrom(_ data: Data) -> Self?
}

extension StructCodable {
    
    public static func getModelFrom(_ data: Data) -> Self? {
        do {
            return try JSONDecoder().decode(Self.self, from: data)
        } catch {
            print("PARSE JSON ERROR: \(error)")
            return nil
        }
    }
}
