//  
//  SimpleDetailPresenterProtocol.swift
//  JsvApp
//
//  Created by jorgeSV on 18/2/23.
//  Copyright © 2023 JSV. All rights reserved.
//

import UIKit

public enum SimpleDetailSignal {
    
}

protocol SimpleDetailSignalDelegate: AnyObject {
    func signalTrigged(_ signal: SimpleDetailSignal)
}

protocol SimpleDetailPresenterProtocol where Self: BasePresenter {
    
    var ui: SimpleDetailPresenterDelegate? { get set }
    var title: String { get }
    
    var sections: [SimpleDetailViewController.Model.Section] { get set }
}

public protocol SimpleDetailPresenterDelegate: BasePresenterDelegate {
    func refresh()
}
