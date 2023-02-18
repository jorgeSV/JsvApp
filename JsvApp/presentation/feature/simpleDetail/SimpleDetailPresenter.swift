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
        
        return sections
    }
    
    // MARK: - Private functions
    
    private func getHeaderSection() -> SimpleDetailViewController.Model.Section? {
        var products = [SimpleDetailViewController.Model.Product]()
        
        if let image = item.image {
            products.append(.header(.init(image: image)))
        }
        
        if let descriptions = item.descriptions, !descriptions.isEmpty {
            for description in descriptions {
                products.append(.item(.init(title: description,
                                            image: nil,
                                            action: { _ in })))
            }
        }
        
        return SimpleDetailViewController.Model.Section(product: products)
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
