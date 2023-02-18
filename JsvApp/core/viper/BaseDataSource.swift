//
//  BaseDataSource.swift
//  JsvApp
//
//  Created by jorgeSV on 16/2/23.
//  Copyright © 2023 JSV. All rights reserved.
//

import Foundation
import Alamofire

public typealias BaseCompletionBlock = (ResultResponse<Data?>) -> Void

public enum ResultResponse<T> {
    case success(T)
    case error(ErrorModel)
}

protocol BaseDataSourceProtocol {
    func executeRequest(_ url: URLConvertible, method: HTTPMethod?, parameters: Parameters?, encoding: URLEncoding, completion: @escaping BaseCompletionBlock)
}

public class BaseDataSource: BaseDataSourceProtocol {
    
    func executeRequest(_ url: URLConvertible, method: HTTPMethod?, parameters: Parameters?, encoding: URLEncoding = URLEncoding.default, completion: @escaping BaseCompletionBlock) {
      
        do {
            guard let urlRequest = try? URLRequest(url: url, method: method ?? .get, headers: nil) else {
                completion(.error(ErrorModel(description: "URL request error")))
                return
            }
            
            guard let request = try? encoding.encode(urlRequest, with: parameters) else {
                completion(.error(ErrorModel(description: "Error encoding request")))
                    return
            }
            
            AF.request(request).responseData(completionHandler: { (response) in
                
                switch response.result {
                case .success(let data):
                    completion(ResultResponse.success(data))
                    break
                    
                case .failure(let error):
                    completion(ResultResponse.error(ErrorModel(description: error.errorDescription ?? "AF request error")))
                    break
                }
            })
        }
    }
    
}
