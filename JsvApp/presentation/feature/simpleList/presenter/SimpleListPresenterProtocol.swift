//  
//  SimpleListPresenterProtocol.swift
//  JsvApp
//
//  Created by jorgeSV on 16/2/23.
//  Copyright © 2023 JSV. All rights reserved.
//

import UIKit

public enum SimpleListSignal {
    case openDetail(SimpleListItem)
}

public protocol SimpleListSignalDelegate: AnyObject {
    func signalTrigged(_ signal: SimpleListSignal)
}

protocol SimpleListPresenterProtocol where Self: BasePresenter {
    
    var ui: SimpleListPresenterDelegate? { get set }
    var title: String { get }
    
    var sections: [SimpleListViewController.Model.Section] { get set }
    
    func loadMoreItems()
}

public protocol SimpleListPresenterDelegate: BasePresenterDelegate {
    func refresh()
}
