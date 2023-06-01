//  
//  SimpleDetailPresenter.swift
//  JsvApp
//
//  Created by jorgeSV on 18/2/23.
//  Copyright © 2023 JSV. All rights reserved.
//

import UIKit

class SimpleDetailPresenter: BasePresenter {
    
    // MARK: - Properties
    
    private weak var signalDelegate: SimpleDetailSignalDelegate?
    public weak var ui: SimpleDetailPresenterDelegate?
    
    let simpleInteractor: SimpleInteractor
    
    var _sections: [SimpleDetailViewController.Model.Section] = []
    var item: SimpleListItem
//    var detail: SimpleDetailItem
    
    // MARK: - Initialization
    
    public init(signalDelegate: SimpleDetailSignalDelegate,
                simpleInteractor: SimpleInteractor,
                selectedItem: SimpleListItem) {
        self.signalDelegate = signalDelegate
        self.simpleInteractor = simpleInteractor
        self.item = selectedItem
    }
    
    // MARK: - SimpleDetailPresenter Functions
    
    public override func viewDidLoad() {
    }
    
    public override func viewWillAppear() {
    }
    
    // MARK: - Sections
    
    func getSections() -> [SimpleDetailViewController.Model.Section] {
        var sections: [SimpleDetailViewController.Model.Section] = []
        
        if let section = getHeaderSection() {
            sections.append(section)
        }
        
        if let section = getListSection() {
            sections.append(section)
        }
        
        return sections
    }
    
    // MARK: - Private functions
    
    private func getHeaderSection() -> SimpleDetailViewController.Model.Section? {
        var products = [SimpleDetailViewController.Model.Product]()
        
        if let image = item.image {
            products.append(.header(.init(image: image)))
            return .init(product: products)
        }
        
        return nil
    }
    
    private func getListSection() -> SimpleDetailViewController.Model.Section? {
        var products = [SimpleDetailViewController.Model.Product]()
        
        if let list = item.list, !list.isEmpty {
            for item in list {
                products.append(.item(.init(title: item,
                                            image: nil,
                                            action: { _ in })))
            }
            
            return .init(header: .init(title: item.listTitle ?? ""), product: products)
        }
        
        return nil
    }
    
}

extension SimpleDetailPresenter: SimpleDetailPresenterProtocol {
    
    public var title: String {
        item.name
    }
    
    public var sections: [SimpleDetailViewController.Model.Section] {
        get {
            return _sections.isEmpty ? getSections() : _sections
        }
        set {
            _sections = newValue
        }
    }
    
}
