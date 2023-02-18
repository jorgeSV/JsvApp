//
//  BasePresenter.swift
//  JsvApp
//
//  Created by jorgeSV on 16/2/23.
//  Copyright © 2023 JSV. All rights reserved.
//

import Foundation

public class BasePresenter {
    
    public func viewWillAppear() { }
    public func viewDidLoad() { }
    public func viewDidAppear() { }
    public func viewDidDisappear() { }
}

public protocol BasePresenterDelegate: AnyObject {
    func showLoading()
    func hideLoading()
}
