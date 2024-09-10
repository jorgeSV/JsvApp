//
//  SimpleCoordinator.swift
//  JsvApp
//
//  Created by jorgeSV on 16/2/23.
//  Copyright © 2023 JSV. All rights reserved.
//

import UIKit

public class SimpleCoordinator: @preconcurrency Coordinator {
   
    // MARK: - Properties
    
    private let navigationController: UINavigationController
    private var childCoordinator: Coordinator?
    private let simpleDependencies: SimpleDependencies = SimpleDependencies()
    @MainActor static var containerView: UIViewController?
    
    // MARK: - Init
    
    public init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: - Coordinator
    
    @MainActor public func resolve() {
        openSimpleListContainerView()
    }
    
    // MARK: - SimpleCoordinatorProtocol Functions
    
    @MainActor func openSimpleListContainerView() {
        let viewController = simpleDependencies.makeSimpleListView(self)
        SimpleCoordinator.containerView = viewController
        navigationController.pushViewController(viewController, animated: true)
    }
    
    @MainActor func openSimpleDetailContainerView(selectedItem: SimpleListItem) {
        let viewController = simpleDependencies.makeSimpleDetailView(self, selectedItem: selectedItem)
        SimpleCoordinator.containerView = viewController
        navigationController.pushViewController(viewController, animated: true)
    }
    
}

// MARK: - SimpleListSignalDelegate

extension SimpleCoordinator: @preconcurrency SimpleListSignalDelegate {
    
    @MainActor public func signalTrigged(_ signal: SimpleListSignal) {
        switch signal {
        case .openDetail(let model):
            openSimpleDetailContainerView(selectedItem: model)
        }
    }
}

extension SimpleCoordinator: SimpleDetailSignalDelegate {
    
    func signalTrigged(_ signal: SimpleDetailSignal) {
        
    }
}
