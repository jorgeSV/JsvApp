//
//  SimpleDependencies.swift
//  JsvApp
//
//  Created by jorgeSV on 16/2/23.
//  Copyright © 2023 JSV. All rights reserved.
//

import Foundation

protocol SimpleDependenciesProtocol {
    func makeSimpleListView(_ signalDelegate: SimpleListSignalDelegate) -> SimpleListViewController
    func makeSimpleDetailView(_ signalDelegate: SimpleDetailSignalDelegate, selectedItem: SimpleListItem) -> SimpleDetailViewController
}

public class SimpleDependencies: SimpleDependenciesProtocol {
    
    func makeSimpleListView(_ signalDelegate: SimpleListSignalDelegate) -> SimpleListViewController {
        let simpleRepository = SimpleRepository.shared
        let simpleInteractor = SimpleInteractor(simpleRepository: simpleRepository)
        let presenter = SimpleListPresenter(signalDelegate: signalDelegate, simpleInteractor: simpleInteractor)
        let viewController = SimpleListViewController(presenter)
        presenter.ui = viewController
        return viewController
    }
    
    func makeSimpleDetailView(_ signalDelegate: SimpleDetailSignalDelegate, selectedItem: SimpleListItem) -> SimpleDetailViewController {
        let simpleRepository = SimpleRepository.shared
        let simpleInteractor = SimpleInteractor(simpleRepository: simpleRepository)
        let presenter = SimpleDetailPresenter(signalDelegate: signalDelegate,
                                              simpleInteractor: simpleInteractor,
                                              selectedItem: selectedItem)
        let viewController = SimpleDetailViewController(presenter)
        presenter.ui = viewController
        return viewController
    }
    
}
