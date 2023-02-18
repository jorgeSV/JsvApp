//  
//  SimpleListPresenter.swift
//  JsvApp
//
//  Created by jorgeSV on 16/2/23.
//  Copyright © 2023 JSV. All rights reserved.
//

import UIKit

class SimpleListPresenter: BasePresenter {
    
    // MARK: - Properties
    
    private weak var signalDelegate: SimpleListSignalDelegate?
    public weak var ui: SimpleListPresenterDelegate?
    
    let simpleInteractor: SimpleInteractor
    
    var _sections: [SimpleListViewController.Model.Section] = []
    var items: [SimpleListItem] = []
    var paginateInfo: SimpleInfo?

    // MARK: - Initialization
    
    public init(signalDelegate: SimpleListSignalDelegate, simpleInteractor: SimpleInteractor) {
        self.signalDelegate = signalDelegate
        self.simpleInteractor = simpleInteractor
    }
    
    // MARK: - SimpleListPresenter Functions
    
    public override func viewDidLoad() {
        self.loadItems()
    }
    
    public override func viewWillAppear() {

    }
    
    // MARK: - Load data
    
    private func loadItems() {
        simpleInteractor.getItems(url: paginateInfo?.next, completion:{ [weak self] result in
            guard let self = self else { return }
            
            switch(result) {
            case .success(let model):
                if let results = model.results {
                    self.items.append(contentsOf: results)
                }
                
                self.paginateInfo = model.info
                self.ui?.refresh()
                
            case .error(let error):
                print(error.description ?? "ERROR on SimpleListPresenter")
            }
        })
    }
    
    // MARK: - Sections
    
    func getSections() -> [SimpleListViewController.Model.Section] {
        var sections: [SimpleListViewController.Model.Section] = []
        
        if let section = getItemsSection() {
            sections.append(section)
        }

        return sections
    }
    
    // MARK: - Private functions
    
    private func getItemsSection() -> SimpleListViewController.Model.Section? {
        var products = [SimpleListViewController.Model.Product]()
        
        for item in items {
            products.append(.item(.init(title: item.name,
                                        image: item.image ?? "",
                                        action: { [weak self] _ in
                guard let self = self else { return }
                
                self.signalDelegate?.signalTrigged(.openDetail(item))
            } )))
        }
        
        if let paginateInfo = paginateInfo, let _ = paginateInfo.next {
            products.append(.loading)
        }
                                        
        return SimpleListViewController.Model.Section(product: products)
    }
    
}

extension SimpleListPresenter: SimpleListPresenterProtocol {
    
    public var title: String {
        "Characters"
    }
    
    public var sections: [SimpleListViewController.Model.Section] {
        get {
            return _sections.isEmpty ? getSections() : _sections
        }
        set {
            _sections = newValue
        }
    }
    
    func loadMoreItems() {
        loadItems()
    }
    
}
